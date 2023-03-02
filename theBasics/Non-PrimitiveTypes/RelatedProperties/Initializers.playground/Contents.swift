import Foundation

/// # Initializers
/// Runs when the instance is created
/// No return type
/// The life time of a instance of class/struct/enum Starts with the initializer.
/// There are different kinds of initializers
/// Initializers makes sure that the instance is ready to work.
/// Reference : https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/
/// Example structure
struct Person {
    var name : String
    var age : Int
    
    init(name : String, age: Int){
        self.name = name
        self.age = age
    }
}

var person1 = Person(name: "Anshil", age: 21)

/// Initializer Overloading is possible and it can be overloaded using :
///     1. Argument Label
///     2. Parameter Name and
///     3. Number of parameters

struct People {
    var name : String = ""
    var mobileNumber : String = ""
    var age : Int = 18
    
    ///Default Constructor - if no parameter is passed.
    init(){
        
    }
    
    init(name: String){
        self.name = name
    }
    
    init(mobileNumber: String){
        self.mobileNumber = mobileNumber
    }
    
    init(age: Int){
        self.age = age
    }
    
    init(name: String, mobileNumber: String){
        self.name = name
        self.mobileNumber = mobileNumber
    }
    
    init(name: String, mobileNumber: String, age: Int){
        self.name = name
        self.mobileNumber = mobileNumber
        self.age = age
    }
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    init(mobileNumber: String, age: Int){
        self.mobileNumber = mobileNumber
        self.age = age
    }
    
    init(with name: String){
        self.name = name
    }
    
    init(for name : String){
        self.name = name
    }
    
    init(_ name : String){
        self.name = name
    }
}

let man = People()
let man2 = People("Anshil")
let man3 = People(name: "AnotherMan")
let man4 = People(with: "AnotherAnotherMan")
let man5 = People(for: "AnotherAnotherAnotherMan")
let man6 = People(name: "AnotherAnshil", mobileNumber: "+91-345678903", age: 21)

/// Here we can see the Initializer Overloading concept clearly.


