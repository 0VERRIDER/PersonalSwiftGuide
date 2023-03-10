//
//  User.swift
//  DatabasePractice
//
//  Created by anshil-pt6736 on 09/03/23.
//

import Foundation

struct User : Codable {
    var id : Int = 0
    var name : String = "dummyValue"
    var isLoggedIn : Int = 0
    
}


/// Struct Dummy with dummy Values

let userDummy = User(id: 0,
                     name: "dummyName")
