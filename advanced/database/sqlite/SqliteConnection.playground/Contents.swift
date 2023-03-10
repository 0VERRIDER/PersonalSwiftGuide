import Foundation
import SQLite3

/// # GettingStarted With Sqlite3
/// Reference : https://medium.com/code-with-ayush/sqlite3-integration-with-swift-453c12c1bb49#:~:text=Database%20is%20an%20integral%20part%20of%20almost%20every%20application%20now,along%20with%20some%20analytical%20data.
///
///Allowed DBOperations
///
typealias DBrow = [String:Any]
enum  DBOperations {
    case select
}

///
enum DBError : Error {
    case invalidQuery(String)
}

enum DBdataReturnType{
    case dictionary
    case object
}

struct User : Codable {
    var id : Int
    var name : String
    var age : Int
    var address : String
}

/// Function to  Convert Array Dictionary to Objects
/// - Parameters :
///     - dictionaries : Array Of Dictionary
///     - as : Type of model / Object Type (Should be equal to schema of DB and codable)
/// - Returns : Returns Array Of Specified Type Object
func dictionariesToObjects<T: Codable>(_ dictionaries: [[String: Any]], as type: T.Type) -> [T]? where T: Decodable {
    do {
        let data = try JSONSerialization.data(withJSONObject: dictionaries, options: [])
        let decoder = JSONDecoder()
        let objects = try decoder.decode([T].self, from: data)
        return objects
    } catch {
        print("Error decoding objects: \(error)")
        return nil
    }
}
/// Function to  Convert Dictionary to Object
/// - Parameters :
///     - dictionaries : A Dictionary
///     - as : Type of model / Object Type (Should be equal to schema of DB and codable)
/// - Returns : Returns Array Of Specified Type Object
func dictionaryToObject<T: Codable>(_ dictionary: [String: Any], as type: T.Type) -> T? where T: Decodable {
    do {
        let data = try JSONSerialization.data(withJSONObject: dictionary, options: [])
        let decoder = JSONDecoder()
        let object = try decoder.decode(T.self, from: data)
        return object
    } catch {
        print("Error decoding object: \(error)")
        return nil
    }
}



class FileHandler {
    static let shared = FileHandler()
    
    ///Function to Open a File in specified directory and path
    ///- Parameters :
    ///     - directory : FileManager.SearchPathDirectory
    ///     - path : relative path to the file in the specified directory
    ///- Returns : Full path to the specified file
    ///- Important: Error handling is not done yet
    func open(directory: FileManager.SearchPathDirectory = .documentDirectory, domain: FileManager.SearchPathDomainMask = .userDomainMask , path: String) -> String? {
        let file = try? FileManager.default.url(for: directory, in: .userDomainMask, appropriateFor: nil, create: false).appending(path: path)
        
        if let file = file {
            return file.path
        }
        else {
            return nil
        }
    }
}

class DBHandler {
    var db : OpaquePointer?
    var statement : OpaquePointer?
    
    ///Function to connect to the database
    /// - Parameters :
    ///     - pathToDatabase : Database path, if it doesn't exist it creats the databse.
    func open(_ pathToDatabase : String){
        if (sqlite3_open(FileHandler.shared.open(path: pathToDatabase), &db) != SQLITE_OK){
            print("Error establishing connection to the database!")
        }
        else {
            print("connected to the database.")
        }
    }
    ///Function To Close the DB
    func close(){
        print("DB connection closed.")
        sqlite3_close(db)
    }
    
    /// Function To Prepare the SQL Query
    /// - Parameters:
    ///     - query : Query that to be executed
    ///  - returns : Returns the preparedStatement to execute
    func prepareQuery(query: String) -> Int32?{
        let preparedStatement = sqlite3_prepare(db, query, -1, &statement, nil)
        
        if preparedStatement == SQLITE_OK{
            print("Query Compiled.")
            return preparedStatement
        }
        else{
            print("Invalid Query. \(String(cString: sqlite3_errmsg(db)))")
            return nil
        }
    }
    
    /// Function to Perform  `SELECT` Queries and retrieve data
    /// - Returns : Returns Array of Rows of the result table
    func selectData() -> [DBrow] {
        var results = [DBrow]()
        
        var statusStep = sqlite3_step(statement)
        
        while statusStep == SQLITE_ROW {
            
            if sqlite3_column_count(statement) <= 0 {
                 print("Query result is nil.")
                return []
               }
            
            
            var row = DBrow()

            for i in 0 ..< sqlite3_column_count(statement){
                let columnName = String(cString: sqlite3_column_name(statement, i))
                let type = sqlite3_column_type(statement, i)
                          
                          switch type {
                          case SQLITE_INTEGER:
                              let value = sqlite3_column_int(statement, i)
                              row[columnName] = value
                              
                          case SQLITE_FLOAT:
                              let value = sqlite3_column_double(statement, i)
                              row[columnName] = value

                          case SQLITE_TEXT:
                              let cString = sqlite3_column_text(statement, i)
                              let value = String(cString: cString!)
                              row[columnName] = value

                          default:
                              // Handle unknown data type
                              print("Invalid Data Type Found!")
                              break
                          }
            }
            results.append(row)
            //Next Step / Next Row
            statusStep = sqlite3_step(statement)
            }
        return results
    }
    
    /// Function to execute the Prepared to query
    ///
    /// - Parameters :
    ///     - query: Query to execute
    ///     - queryType: Type of the Query
    ///
    ///  - Returns : `(status: Bool, data: [DBrow])`
    func executeQuery(query: String, queryType: DBOperations = .select) -> (status: Bool, data: [DBrow]){
        
        guard prepareQuery(query: query) != nil else {
            return (status : false, data: [] )
        }
        
        defer{
            sqlite3_finalize(statement)
        }
       
        switch(queryType){
        case .select :
            let data = selectData()
            return (status : true, data: data)
        }
    }
    
}

let query = "SELECT * FROM Users"
let query2 = "SELECT * FROM Users Where id=1"

let dbCon = DBHandler()
dbCon.open("exampleDatabase.db")

let result1 = dbCon.executeQuery(query: query, queryType: .select).data.map{
    dictionaryToObject($0, as: User.self)
}

dbCon.close()
