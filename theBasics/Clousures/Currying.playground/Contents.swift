import Foundation

/// # Currying
/// https://thoughtbot.com/blog/introduction-to-function-currying-in-swift
/// Let's see an example currying.
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

add(2, 4)

/// Using Currying :
let curriedAdd = {
    (firstNumber: Int) -> (Int) -> Int in
    return {
        (secondNumber : Int) -> Int in
            return firstNumber + secondNumber
    }
}

/// Using currying :
let add10 = curriedAdd(5)
let result = add10(5)
/// Or we can do :

let add = curriedAdd(5)(5)

/// Another Example of using currying is:

//let area = {
//    (width: Double) -> (Double) -> Double in
//    return {
//        (length: Double) in
//            return width * length
//    }
//}

///We can Re-write the above as :
func area(width: Double) -> (Double) -> Double {
    return {(length: Double) in return length * width}
}


let areaOfPlotWithWidth10AndHeight20 = area(width: 10)(20)


/// Another Example :

/// Function to add numbers
///
/// firstNumber Parameter takes the first number and return an clousre context which will take the seconNumber add to the firstNumber
///
func add(_ firstNumber: Int) -> (Int) -> Int {
    return {(secondNumber: Int) in return firstNumber * secondNumber}
}

let addTwo = add(2)

var arrayOfNumbers = [2,3,4,6,8]

print(arrayOfNumbers.map(addTwo)) // added two to every value

//TODO: Use Generics In Currying

