import Foundation
import SQLite3

/// # GettingStarted With Sqlite3
/// Reference : https://medium.com/code-with-ayush/sqlite3-integration-with-swift-453c12c1bb49#:~:text=Database%20is%20an%20integral%20part%20of%20almost%20every%20application%20now,along%20with%20some%20analytical%20data.
///
///Allowed DBOperations
enum  DBOperations {
    case select
}

///
enum DBError : Error {
    case invalidQuery(String)
}

struct Result {
    var id : Int
    var name : String
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
    var results : Result?
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
    
    func close(){
        sqlite3_close(db)
    }
    
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
    
    func selectData() -> [String:Any] {
        var results = [String:Any]()
        var statusStep = sqlite3_step(statement)
        while statusStep == SQLITE_ROW {
            
            if sqlite3_column_count(db) == 0 {
                 print("Query result is nil.")
                return [:]
               }
            
            
            
            for i in 0..<sqlite3_column_count(db){
                
                let columnName = String(cString: sqlite3_column_name(statement, i))
                let type = sqlite3_column_type(statement, i)
                          
                          switch type {
                          case SQLITE_INTEGER:
                              let value = sqlite3_column_int(statement, i)
                              results[columnName] = value
                              
                          case SQLITE_FLOAT:
                              let value = sqlite3_column_double(statement, i)
                              results[columnName] = value

                          case SQLITE_TEXT:
                              let cString = sqlite3_column_text(statement, i)
                              let value = String(cString: cString!)
                              results[columnName] = value

                          default:
                              // Handle unknown data type
                              print("Invalid Data Type Found!")
                              break
                          }
            }
            statusStep = sqlite3_step(statement)
            }
        
        return results
    }
    
    func executeQuery(query: String, queryType: DBOperations) -> (status: Bool, data: [String:Any]){
        guard prepareQuery(query: query) != nil else {
            return (status : false, data: [:] )
        }
        
        defer{
            sqlite3_finalize(statement)
        }
       
        switch(queryType){
        case .select :
            return (status : true, data: selectData() )
        }
        
        
        
    }


    
    func exec(query: String){
    
    }
}

let query = "SELECT * FROM User"
let dbCon = DBHandler()
dbCon.open("exampleDatabase.db")
print(dbCon.executeQuery(query: query, queryType: .select))


dbCon.close()
