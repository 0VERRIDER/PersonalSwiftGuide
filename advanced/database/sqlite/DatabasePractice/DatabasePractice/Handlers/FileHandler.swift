//
//  FileHandler.swift
//  DatabasePractice
//
//  Created by anshil-pt6736 on 09/03/23.
//


import Foundation

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
