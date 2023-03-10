//
//  DBHandler.swift
//  DatabasePractice
//
//  Created by anshil-pt6736 on 09/03/23.
//
import Foundation
import SQLite3

typealias DBrow = [String: Any]
class DBHandler : DatabaseContract {
  /// Pointer holding reference to the Database
  var dbPointer: Sqlite3?
  /// Pointer holding reference to currentlt loaded query
  var statementPointer: Sqlite3?
    
    required init(for databasePath: String){
        open(databasePath)
    }
    deinit{
        close()
    }
  ///Function to connect to the database
  /// - Parameters :
  ///     - pathToDatabase : Database path, if it doesn't exist it creats the databse.
  func open(_ pathToDatabase: String) {
    if sqlite3_open(FileHandler.shared.open(path: pathToDatabase), &dbPointer) != SQLITE_OK {
      print("Error establishing connection to the database.")
    } else {
      print("Connected to the database.")
    }
  }

  ///Function To Close the DB
  func close() {
    /// Function to clear the reference to the databace / close reference.
    sqlite3_close(dbPointer)
    print("DB connection closed.")
  }

  /// Function To Prepare the SQL Query
  /// - Parameters:
  ///     - query : Query that to be executed
  ///  - returns : Returns the preparedStatement to execute
  func prepareQuery(query: String) -> Int32? {
    /// Holds the prepared statement from supplied Query
    let preparedStatement = sqlite3_prepare(dbPointer, query, -1, &statementPointer, nil)
    if preparedStatement == SQLITE_OK {
      print("Query Compiled.")
      return preparedStatement
    } else {
      /// Holds current occured error, if occured
      let error = String(cString: sqlite3_errmsg(dbPointer)).capitalized
      print("Invalid Query. \(error)")
      return nil
    }
  }

  /// Function to Perform  `SELECT` Queries and retrieve data
  /// - Parameters:
  ///     - columns : Array of Name of columns to retrive
  ///     - from : Table name where data exist
  ///     - where : Where close with conditions
  ///     - as : Type of object
  /// - Returns : Returns Array Of Object of specified type.
  func select<T>(
    _ columns: [String] = ["*"], from tableName: String, where conditions: String, as type: T.Type
  ) -> [T]? where T: Codable {
      let query = "SELECT \(columns.joined(separator:",")) FROM \(tableName) \(conditions != "" ? "WHERE \(conditions)" : "")"

      print(query)
    guard prepareQuery(query: query) != nil else {
      return []
    }

    defer {
      sqlite3_finalize(statementPointer)
    }

    /// Holds the results from the database. Array of Dictionary. DBrow is an alias for [String: Any]
    var results = [DBrow]()
    /// Execute one step using the compiled query
    var statusStep = sqlite3_step(statementPointer)
    while statusStep == SQLITE_ROW {
      /// Checks if Query returned any row
      if sqlite3_column_count(statementPointer) <= 0 {
        print("Query result is nil.")
        return []
      }
      /// Variable to hold each row data
      var row = DBrow()
      for i in 0..<sqlite3_column_count(statementPointer) {
        /// Get each column Names
        let columnName = String(cString: sqlite3_column_name(statementPointer, i))
        /// Get type of the column
        let type = sqlite3_column_type(statementPointer, i)

        switch type {
        case SQLITE_INTEGER:
          let value = sqlite3_column_int(statementPointer, i)
          row[columnName] = value

        case SQLITE_FLOAT:
          let value = sqlite3_column_double(statementPointer, i)
          row[columnName] = value

        case SQLITE_TEXT:
          let cString = sqlite3_column_text(statementPointer, i)
          let value = String(cString: cString!)
          row[columnName] = value

        case SQLITE_NULL:
          row[columnName] = nil

        default:
          // Handle unknown data type
          print("Invalid Data Type Found!")
          break
        }
      }
      /// Appending each row to the results
      results.append(row)
      /// Next Step  /  Next Row
      statusStep = sqlite3_step(statementPointer)
    }
      return Utilities.converted(results, to: T.self)
  }
    
    /// Function to Perform  `SELECT` Queries and retrieve data
    /// - Parameters:
    ///     - query : The Query to be executed
    /// - Returns : Returns Array Of Object of specified type.
    func select(
      _ columns: [String], from tableName: String, where conditions: String
    ) -> [DBrow] {
        let query = "SELECT \(columns.joined(separator:",")) FROM \(tableName) \(conditions != "" ? "WHERE \(conditions)" : "")"

        print(query)
      guard prepareQuery(query: query) != nil else {
        return []
      }

      defer {
        sqlite3_finalize(statementPointer)
      }

      /// Holds the results from the database. Array of Dictionary. DBrow is an alias for [String: Any]
      var results = [DBrow]()
      /// Execute one step using the compiled query
      var statusStep = sqlite3_step(statementPointer)
      while statusStep == SQLITE_ROW {
        /// Checks if Query returned any row
        if sqlite3_column_count(statementPointer) <= 0 {
          print("Query result is nil.")
          return []
        }
        /// Variable to hold each row data
        var row = DBrow()
        for i in 0..<sqlite3_column_count(statementPointer) {
          /// Get each column Names
          let columnName = String(cString: sqlite3_column_name(statementPointer, i))
          /// Get type of the column
          let type = sqlite3_column_type(statementPointer, i)

          switch type {
          case SQLITE_INTEGER:
            let value = sqlite3_column_int(statementPointer, i)
            row[columnName] = value

          case SQLITE_FLOAT:
            let value = sqlite3_column_double(statementPointer, i)
            row[columnName] = value

          case SQLITE_TEXT:
            let cString = sqlite3_column_text(statementPointer, i)
            let value = String(cString: cString!)
            row[columnName] = value

          case SQLITE_NULL:
            row[columnName] = nil

          default:
            // Handle unknown data type
            print("Invalid Data Type Found!")
            break
          }
        }
        /// Appending each row to the results
        results.append(row)
        /// Next Step  /  Next Row
        statusStep = sqlite3_step(statementPointer)
      }
        return results
    }

  func createTable<T: Codable>(_ tableName: String, for dummyModel: T) -> Bool {
    let model = Mirror(reflecting: dummyModel.self)
    let properties = model.children

    var query = "CREATE TABLE IF NOT EXISTS \(tableName) ("

    for (index, property) in properties.enumerated() {

      let type: String

      switch property.value {
      case is Int, is Int32, is Int64:
        type = "INTEGER"
      case is Float, is Double:
        type = "REAL"
      case is Bool:
        type = "BOOLEAN"
      case is Date:
        type = "DATETIME"
      case is String:
        type = "TEXT"
      default:
        continue
      }

      query += "\(property.label!) \(type)"
      if index < properties.count - 1 {
        query += ", "
      }
    }

    query += ");"

    guard prepareQuery(query: query) != nil else {
      print("Taable Query Failed")
      return false
    }

    defer {
      sqlite3_finalize(statementPointer)
    }

    if sqlite3_step(statementPointer) == SQLITE_DONE {
      print("Table has been Created.")
      return true
    } else {
      let error = String(cString: sqlite3_errmsg(dbPointer)).capitalized
      print("Error Creating Table : \(error)")
      return false
    }

  }

  func insertInto<T>(_ tableName: String, values: [T]) -> Bool {
    var query = "INSERT INTO \(tableName) VALUES("

    for value in values {
      let model = Mirror(reflecting: value)
      let properties = model.children

      for (index, property) in properties.enumerated() {
        if property.value is String {
          query += "'\(property.value)'"

        } else {
          query += "\(property.value)"
        }

        if index < properties.count - 1 {
          query += ", "
        }
      }

    }

    query += ")"

    guard prepareQuery(query: query) != nil else {
      print("Taable Query Failed")
      return false
    }

    defer {
      sqlite3_finalize(statementPointer)
    }

    if sqlite3_step(statementPointer) == SQLITE_DONE {
      print("Table has been Created")
      return true
    } else {
      let error = String(cString: sqlite3_errmsg(dbPointer)).capitalized
      print("Error Creating Table : \(error)")
      return false
    }

  }

  func exec(query: String) {
    if sqlite3_exec(dbPointer, query, nil, nil, nil) == SQLITE_OK {
      print("Exec: Query Has been executed.")
    } else {
      let error = String(cString: sqlite3_errmsg(dbPointer)).capitalized
      print("Error in exec : \(error)")
    }
  }
}
