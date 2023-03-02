import Foundation
/// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance
/// Example Class to inherit
/// Super Class
class Person {
    var name : String
    var age : Int
    var address : String
    var createdOn : Date
    
    var someRandomProperty : String {
        name + String(age)
    }
    
    var someOtherRandomProperty : String? {
        didSet{
            print("Old Didset in superclass")
        }
    }
    
    init(name: String, age: Int, address: String, createdOn: Date) {
        self.name = name
        self.age = age
        self.address = address
        self.createdOn = createdOn
    }
}

/// Child class / Sub class
class Student : Person {
    var marks : [Double] = []
    
    /// Overrided property of super class in sub class
    override var someRandomProperty: String {
        super.name
    }
    
    /// Overrided Property observer in subclass
    override var someOtherRandomProperty : String? {
        didSet{
            print("New Overrided Didset in subclass")
        }
    }
    
    /// Overriding Super class init
    override init(name: String, age: Int, address: String, createdOn: Date) {
        /// Calling the designated initializer of Super Class
        /// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/
        super.init(name: name, age: age, address: address, createdOn: createdOn)
    }
}

///Creating Person type instance
let person1 = Person(name: "Naveen", age: 21, address: "Manjeri", createdOn: Date())
person1.someRandomProperty
person1.someOtherRandomProperty = "hi" // didSet from superclass is called

/// creating Instance of subclass Student
let student1 = Student(name: "Anshil", age: 21, address: "Thurakkal, Manjeri", createdOn: Date())
student1.someRandomProperty
student1.someOtherRandomProperty = "hello" // didSet Overrided in the

/// Note:
/// We can Prevent Inheritance by making class / property / function as final

final class SuperCalss {
    var someProperty : String?
}


/// Here it will say can't Inherit, Since SuperClass is Final
//class SubClass : SuperCalss {
    
//}

class Employee {
    var name : String
    var experience : Double
    final var salary : Double {
        experience * 10000
    }
    
    init(name: String, experience: Double){
        self.name = name
        self.experience = experience
    }
}

class ProjectTrainee : Employee {
    
    /// This will Throw an Error That `salary` variable is `final`.
//    override var salary : Double {
//        1000000000000
//    }
    
    override init(name: String, experience: Double) {
        super.init(name: name, experience: experience)
    }
}
