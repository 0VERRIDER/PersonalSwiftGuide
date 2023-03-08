import Foundation

/// Protocol For Containers
protocol Containable {
    associatedtype Item
    
    var items : [Item] {get set}
    var count : Int { get }
}

/// Stack Data structure using the Containable Protocol
struct Stack<T: Equatable> : Containable {
    typealias Item = T
    
    var items: [Item]
    var count: Int {
        items.count
    }
    
    /// Function to add / push data to the top of the stack
    mutating func push(_ valueToPush: Item) -> Item {
        items.append(valueToPush)
        return valueToPush
    }
    
    /// Function to remove / pop data from Stack (Last Item)
    mutating func pop() -> Item {
        return items.removeLast()
    }
    
    /// Function to  clear the stack
    mutating func clearStack(){
        items.removeAll()
    }
}


extension Stack where Item == Int { // Extension for stack where Item is type of Int (Integer Stack)
    func printItsInt() {
        print("Its an integer stack")
    }
}

extension Stack where Item == String { // Extension for stack where Item is type of String (String Stack)
    func printItsString() {
        print("Its a String stack")
    }
}

var stackExample = Stack(items: [2,3,4,5,6])

stackExample.pop()
stackExample

stackExample.push(10)
stackExample
stackExample.printItsInt() // Prints "Its an integer stack"

var stringStackExample = Stack(items: ["Hi","Hello"])
stringStackExample.pop()
stringStackExample.count

stringStackExample.printItsString()

