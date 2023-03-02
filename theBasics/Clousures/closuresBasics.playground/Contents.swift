import Foundation

/// # Clousures
///https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures
/// ```{ (parametes) -> return Type in
///
///         Statements
///
///    }```
///
/// Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.
///Example:

extension [Int] {
    var sum : Int {
        self.reduce(0, +) // reduce(initialValue, OperationToBeDone)
    }
}

struct Student{
    let name : String
    var marks : [Int] // List of marks
}

var studentList = [Student(name: "Anshil", marks: [10,20,30]), Student(name: "Ameen", marks: [30,30,30]),Student(name: "Naveen", marks: [40,20,40])] // Added Students to the studentList


/// Here we are passing a clousure to tell the sorted function how to handle the data,
/// We are trying to sort the Students According to the Total marks they got

print(studentList.sorted(by: {stud1,stud2 in return stud1.marks.sum > stud2.marks.sum}))

/// We dont have to Explicitly say to return
print(studentList.sorted(by: {stud1,stud2 in stud1.marks.sum > stud2.marks.sum}))

/// We have a Short hand method here
/// $0 access the first Element and $1 Access the next element
print(studentList.sorted(by: {$0.marks.sum > $1.marks.sum}))

/// # Capturing Values
/// From the Example in Apple Swift Document :

func makeIncrementer(toIncrementBy amount: Int) -> () -> Int {
    var total = 0
    
    func incrementer() -> Int {
        total += amount
        return total
    }
    return incrementer
}

///If itsnot returning a clousure
func makeIncrementerUsingFunc(toIncrementBy amount: Int) -> Int {
    var total = 0
    total += amount
    return total
}

/// Using the function returning a clousure
let incrementByTen = makeIncrementer(toIncrementBy: 10)
incrementByTen()
incrementByTen()
let anotherIncrementByTen = incrementByTen
anotherIncrementByTen()

/// Using a Normal Function.
let incrementByTenUsingFunc = makeIncrementerUsingFunc(toIncrementBy: 10)
let anotherIncrementByTenUsingFunc = makeIncrementerUsingFunc(toIncrementBy: 10)


let incrementByFive = makeIncrementer(toIncrementBy: 5)
incrementByFive()
incrementByFive()
let alsoIncrementByFive = incrementByFive
alsoIncrementByFive() // Shows that its Reference Type

/// # Closures and Functions Are Reference Type
///
///

