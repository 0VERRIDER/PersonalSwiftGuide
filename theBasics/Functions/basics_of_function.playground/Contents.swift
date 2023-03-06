import Foundation

/// # Basics Of Function
///
///Declaration of Example Function.
///
/// ```
///
/// func <function_name>(<parameters>) -> <return_type> {
///         <statements>
///  }
///
///  ```
func exampleFunction(with anExamplePrameter: String) -> String {
    return anExamplePrameter.capitalized
}

exampleFunction(with: "Its Working!!!!!") // Will return the passed String.

/// # A Function Without Any Return Values and multiple Parameters
func exampleWithoutReturnValues(with parameterOne: String, and parameterTwo: Int){
    print("Parameter One is : '\(parameterOne)' and Parameter two is : '\(parameterTwo)'")
}

exampleWithoutReturnValues(with: "this", and: 2) // Prints the data, the function never return anything

/// # A Function with Multiple Return values (Use Tuple)

func exampleMultipltReturnValues(with parameterOne: String, parameterTwo : String, and parameterThree: Int) -> (String, String, Int){
    return (parameterOne,parameterTwo,parameterThree)
}

let placeholderValues = exampleMultipltReturnValues(with: "Hi", parameterTwo: "there", and: 11)
print(placeholderValues) // Returns tuple of values together

/// # Function with Argument Labels
func book(seat seatNumber: Int, for username: String, on bookingDate: Date) -> String {
    print("Seat Number : \(seatNumber) has been book for \(username) on \(bookingDate).")
    return "Seat Booked."
}

book(seat: 21, for: "Anshil", on: Date()) // Note: Date() is Date right now
/// Function arguments gives alot of readability to the code.
/// And can be also used for overloading the functions.

/// # Inout Parameter

var aNumber = 20

/// this function will change the actula Value of the input
/// Inout
func alter(_ input: inout Int, to output: Int){
    input = output
}

alter(&aNumber, to: 23)
aNumber // Value has been changed in the root.

/// If this wasn't an Inout function, you will have to do like :

var anotherNumber = 30

func altered(_ input: Int, to output : Int) -> Int {
    //input = output // will generate an error that input is a constant.
    return output
}

/// Basically a stupid example
/// But you know whats happening behind the scenes.
anotherNumber = altered(anotherNumber, to: 40) // I will have to change like this to replace the value, if its not an inout

/// But dont get wrong that inout is pass by reference its not.
/// inout is just copying value back to the variable after the function execution.
/// inout is a Pass-by-value-and-copy-back.

