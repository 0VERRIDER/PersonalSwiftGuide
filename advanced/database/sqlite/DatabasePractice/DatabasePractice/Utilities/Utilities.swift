//
//  Utilities.swift
//  DatabasePractice
//
//  Created by anshil-pt6736 on 10/03/23.
//

import Foundation


struct Utilities {
    /// Function to  Convert Array Dictionary to Objects
    /// - Parameters :
    ///     - dictionaries : Array Of Dictionary
    ///     - as : Type of model / Object Type (Should be equal to schema of DB and codable)
    /// - Returns : Returns Array Of Specified Type Object
    static func converted<T: Codable>(_ dictionaries: [[String: Any]], to type: T.Type) -> [T]? where T: Decodable {
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
    static func converted<T: Codable>(_ dictionary: [String: Any], to type: T.Type) -> T? where T: Decodable {
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
}
