import Foundation
import SQLite3

/// # GettingStarted With Sqlite3
/// Reference : https://medium.com/code-with-ayush/sqlite3-integration-with-swift-453c12c1bb49#:~:text=Database%20is%20an%20integral%20part%20of%20almost%20every%20application%20now,along%20with%20some%20analytical%20data.
///

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
    var connectionPointer : OpaquePointer?
    ///Function to connect to the database
    /// - Parameters :
    ///     - pathToDatabase : Database path, if it doesn't exist it creats the databse.
    func open(_ pathToDatabase : String){
        if (sqlite3_open(FileHandler.shared.open(path: pathToDatabase), &connectionPointer) != SQLITE_OK){
            print("Error establishing connection to the database!")
        }
        else {
            print("connected to the database.")
        }
    }
    
    func exec(query: String){
        sqlite3_exec(connectionPointer){
            
        }
    }
}

let dbCon = DBHandler()
dbCon.open("exampleDatabase.db")
