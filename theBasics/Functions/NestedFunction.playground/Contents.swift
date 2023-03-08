import Foundation


/// # NestedFunctions
/// A Function with nested Function
func aRandomFunction(){
    let a  = 2
    
    func anotherRandomFunction(){
        print("getting value from outer function : \(a)")
    }
    
    anotherRandomFunction()
}


aRandomFunction()

/// A function with nested function and with parameter

func squared(n : Int) -> Int {
    func multiply(lhs: Int, rhs: Int) -> Int{
        return lhs * rhs
    }
    
    return multiply(lhs: n, rhs: n)
}

print("Square of 2 is : \(squared(n: 2))")

/// Nested Function with function return

func makeIncrementer(of incrementValue: Int) -> () -> Int {
    var amount = 0
    func Incrementer() -> Int {
        amount += incrementValue
        return amount
    }
    return Incrementer
}

var incrementerOf2 = makeIncrementer(of: 2)
incrementerOf2()
incrementerOf2()
incrementerOf2()

/// Nested Function with Multiple function/clousure return (incrementer and multiplier)

func makeIncrementerAndMultiplier(n: Int) -> (incrementer: () -> Int, multiplier: () -> Int){
    var amountOfIncrement = 0
    var amountOfMultiplier = 1
    
    func incrementer() -> Int {
        amountOfIncrement += n
        return amountOfIncrement
    }
    
    func multiplier() -> Int {
        amountOfMultiplier *= n
        return amountOfMultiplier
    }
    
    return (incrementer: incrementer, multiplier: multiplier)
}

let incrementerAndMultiplerWith2 = makeIncrementerAndMultiplier(n: 2)
incrementerAndMultiplerWith2.multiplier()
incrementerAndMultiplerWith2.multiplier()
incrementerAndMultiplerWith2.multiplier()

incrementerAndMultiplerWith2.incrementer()
incrementerAndMultiplerWith2.incrementer()
incrementerAndMultiplerWith2.incrementer()
