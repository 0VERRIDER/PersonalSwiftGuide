import Foundation

struct Address {
    let firstLine : String //first line of address
    let secondLine : String // second line of address
    let city : String // City name
    let district : String // District
    let state : String // State
    let country : String // Country Name
    let postalCode : String // Postal Code
}

class Person {
    var name : String
    var age  : Int
    var address : Address
    
    init(name: String, age: Int, address: Address) {
        self.name = name
        self.age = age
        self.address = address
    }
}

class Student : Person {
    var marks = [Double]()
    
    override init(name: String, age: Int, address: Address) {
        super.init(name: name, age: age, address: address)
    }
}

let address = Address(firstLine: "Address Line 1", secondLine: "Line 2", city: "Manjeri", district: "Malappuram", state: "Kerala", country: "India", postalCode: "676121")

var student = Student(name: "Anshil", age: 21, address: address)
/// Assigned Marks to `student`
student.marks = [2,3,4,5]

/// Upcasting to Person
var newStudent = student as Person
//newStudent.marks is unavailable since its Person Type

// Downcasting again
if let downCastedStudent = newStudent as? Student {
    print("Your Marks are \(downCastedStudent.marks)")
}
else {
    print("DownCasting failed.")
}

