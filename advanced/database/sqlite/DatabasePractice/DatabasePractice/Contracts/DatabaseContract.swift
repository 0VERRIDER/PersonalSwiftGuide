//
//  DatabaseContract.swift
//  DatabasePractice
//
//  Created by anshil-pt6736 on 10/03/23.
//

import Foundation

protocol DatabaseContract {
    /// Pointer holding reference to the Database
    var dbPointer : Sqlite3? {get set}
    /// Pointer holding reference to currentlt loaded query
    var statementPointer : Sqlite3? {get set}
    
    init(for databasePath: String)
    
    ///Function to connect to the database
    /// - Parameters :
    ///     - pathToDatabase : Database path, if it doesn't exist it creats the databse.
    func open(_ pathToDatabase: String)
    ///Function To Close the DB
    func close()
    /// Function To Prepare the SQL Query
    /// - Parameters:
    ///     - query : Query that to be executed
    ///  - returns : Returns the preparedStatement to execute
    func prepareQuery(query: String) -> Int32?
    /// Function to Perform  `SELECT` Queries and retrieve data
    /// - Parameters:
    ///     - columns : Array of Name of columns to retrive
    ///     - from : Table name where data exist
    ///     - where : Where close with conditions
    ///     - as : Type of object
    /// - Returns : Returns Array Of Object of specified type.
    func select<T>(
      _ columns: [String], from tableName: String, where conditions: String, as type: T.Type
    ) -> [T]? where T: Codable
    /// Function to Perform  `SELECT` Queries and retrieve data
    /// - Parameters:
    ///     - query : The Query to be executed
    /// - Returns : Returns Array Of Object of specified type.
   func select(
      _ columns: [String], from tableName: String, where conditions: String
    ) -> [DBrow]
    
    func createTable<T: Codable>(_ tableName: String, for dummyModel: T) -> Bool
    
    func insertInto<T>(_ tableName: String, values: [T]) -> Bool
    
    func exec(query: String)
}
