import Foundation

class ClassRoom {
    let classId : Int
    var students = [String]()
    static var classNumber = 0
    
    init(classId: Int, students: [String]){
        self.classId = classId
        self.students = students
    }
    
    // Convinenience can be used to hide complex designated initializers.
    // Or to provide default value to the designated init we can use convinience.
    // As the name says We can make the Initializer Convinient for usage and readability
    
    convenience init(students: [String]){
        let classId = ClassRoom.classNumber + 1
        ClassRoom.classNumber += 1
        self.init(classId: ClassRoom.classNumber, students: students)
    }
}

let classRoom1 = ClassRoom(students: ["Anshil P","Some Other Kid", "You"])
///here we used convenience to generate classId Automatically


/// Failable Initializer
class Person {
    var name : String
    var age : Int
    
    init?(name: String, age: Int){
        if name.isEmpty || age<0 {
            return nil // Returns nil if the conditions are false, indicating the initialization failed.
        }
        
        self.name = name
        self.age = age
    }
}

let person1 = Person(name: "Anshil", age: 21)
let person2 = Person(name: "", age: 10) /// `nil` Indicates that initialization has been Failed.
let person3 = Person(name: "Naveen", age: -1) /// `nil` indicates thart initialization has been failed.
