import Foundation

/// # Instance Methods
struct Person {
    var name : String
    /// A Function to change name to another
    /// ```
    /// var person = Person(name: "Allen")
    ///
    /// instance.nameChange(to : "Anshil")
    ///
    /// ```
    ///
    /// - Parameters :
    ///     - to : `newName` that you want to change
    ///
    ///   - Returns :
    ///     - oldName : The name before changing
    ///     - newName : The new name that we set.
    mutating func nameChange(to newName: String) -> (oldName: String, newName : String){
        let oldName = name
        name = newName
        return (oldName: oldName, newName: name)
    }
    /// A Function to change name to another by not replacing th value in the actual struct
    /// ```
    /// var person = Person(name: "Allen")
    ///
    /// instance.nameChanged(to : "Anshil") // returns a new instance with changes
    ///
    /// ```
    ///
    /// - Parameters :
    ///     - to : `newName` that you want to change
    ///
    ///   - Returns :
    ///     - new Instance with changes
    mutating func nameChanged(to newName: String) -> Self{
        var newPerson = self
        newPerson.name = newName
        return newPerson
    }
}

var person = Person(name: "Allen")
/// Value will change in place
person.nameChange(to: "Anshil")
person.name
/// Value won't change in place
person.nameChanged(to: "Naveen") // This returns a new cahnged struct element
person.name
/// to change the value using the nameChanged, we will have to do :
person = person.nameChanged(to: "Nikhil")
person.name
/// # Type Methods or Static Methods
/// Static methods are associated with the type or it doesnt call through the instance, instead we can call directly without making the instance:

/// Extended the Person Structure
extension Person {
    /// A function to demonstrate the Static method
    static func exampleStaticMethod(){
        print("Access Me through the Type.")
    }
}

/// the method accessible through the type.
/// Static Methods are called as `Type Methods` in Swift.
Person.exampleStaticMethod()

