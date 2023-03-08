import Foundation

/// # Generics - Basics
///
///Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoids duplication and expresses its intent in a clear, abstracted manner.


/// Basic Example Where generics Will be Useful :

var a = 2
var b = 3

func swapIntegerValues(_ a: inout Int, _ b: inout Int){
    let temp = a
    a = b
    b = temp
}

//Before Swapping
print("a: \(a) and b: \(b)")

swapValues(&a, &b)

//AfterSwapping
print("a: \(a) and b: \(b)")

// Swap Function for Double Value
func swapDoubleValues(_ a: inout Double, _ b: inout Double){
    let temp = a
    a = b
    b = temp
}

// Swap Function For String Values
func swapStringValues(_ a: inout String, _ b: inout String){
    let temp = a
    a = b
    b = temp
}

/// Here we had to create different functions for different swap functions the only difference is in the type and the logic remains the same.
/// In order to fix this redundancy we can make use of the Generics :
/// For example:

var firstIntValue = 1
var secondIntValue = 2
//Before Swapping
print("before firstValue: \(firstIntValue) and secondValue: \(secondIntValue)")

var firstStringValue = "hello"
var secondStringValue = "Hi"
//Before Swapping
print("before firstValue: \(firstStringValue) and secondValue: \(secondStringValue)")

var firstDoubleValue = 2.3
var secondDoubleValue = 4.3
//Before Swapping
print("before firstValue: \(firstDoubleValue) and secondValue: \(secondDoubleValue)")

///Generic Function to swap two values.
func swapValues<T>(_ lhs: inout T, _ rhs: inout T){
    let temp = lhs
    lhs = rhs
    rhs = temp
}

/// We can make Use this function to swap any type of values, be it Int, Double or String

swapValues(&firstIntValue, &secondIntValue)
//After Swapping
print("After Swap,  firstValue: \(firstIntValue) and secondValue: \(secondIntValue)")

swapValues(&firstStringValue, &secondStringValue)
//After Swapping
print("After Swap,  firstValue: \(firstStringValue) and secondValue: \(secondStringValue)")

swapValues(&firstDoubleValue, &secondDoubleValue)
//After Swapping
print("After Swap,  firstValue: \(firstDoubleValue) and secondValue: \(secondDoubleValue)")


/// We could omit alot and alot of code, and also we dont have to specify function for each and everyType

/// But what if we want to Restring it to only one type or specificType ?

func swapEquatables<T : Equatable>(_ lhs: inout T, _ rhs: inout T){
    let temp = lhs
    lhs = rhs
    rhs = temp
}

protocol Person{
    var name : String {get set}
}

struct PersonDetails : Person {
    var name : String
    
    init(_ name: String){
        self.name = name
    }
}

var person1 = PersonDetails("Anshil")
var person2 = PersonDetails("Naveen")

//Before Swapping
print("before person1: \(person1.name) and person2: \(person2.name)")

swapValues(&person1, &person2)

//Before Swapping
print("before person1: \(person1.name) and person2: \(person2.name)") // It swap everything

/// With our restricted function
swapEquatables(&person1, &person2) // will generate and error that PersonDetails should be an Equatable.
// So that we can restrict the type of the argument here
