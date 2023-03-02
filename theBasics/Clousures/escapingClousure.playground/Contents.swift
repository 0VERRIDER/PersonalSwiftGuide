import Foundation

/// # Escaping Clousre
/// Used to escape the scope of clousure from the function to outside.

typealias ExampleClousreType = ()->() // alias for the Clousure type

var arrayOfClousures : [ExampleClousreType] = [] // An Array to store clousre outside the function

func add(this clousure: @autoclosure @escaping ExampleClousreType, to array: inout [ExampleClousreType]){
    array.append(clousure) // Appending Clousure into the `arrayOfClousures`
}

add(this: print("Hello"), to: &arrayOfClousures) // passing the print Function to the arrayOfClousres
/// Which means that the scope of Clousre is out side the func add.

arrayOfClousures[0]() // I can call the stored clousre here.

/// # Real World Use case : 
/// closures are often used to encapsulate functionality and pass it around as a first-class object. Sometimes, however, it may be necessary to escape a closure from a function to be used outside of the function's scope. One common use case for escaping closures in Swift is asynchronous programming, where a closure is passed as an argument to a function that initiates an asynchronous operation and calls the closure when the operation is complete.

