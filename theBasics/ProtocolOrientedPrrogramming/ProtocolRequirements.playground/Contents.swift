import Foundation

enum StackError : Error {
    case stackOverflow, stackUnderflow
}

protocol Stack {
    associatedtype Item
    var items : [Item] {get set} // Required Property
    var maxSize : Int {get set}
    var count : Int {get}
    
    mutating func push(_ item: Item) throws // Required Function/Method
    mutating func pop() throws -> Item
    init()
    init(maxSize: Int) // Required Init.. In this case we are using an empty init
}

extension Stack { // Default Implementation
    /// Function to Add Elements to the end of the Stack
    ///
    /// - Parameters:
    ///     - _  : The item to be added to the stack
    /// - Returns: None
    mutating func push(_ item: Item) throws { /// Logic for Push Operation.
        if self.count >= maxSize{
            throw StackError.stackOverflow
        }
        else{
            items.append(item)
        }
    }
    /// Function to remove element from the end of the stack.
    ///
    /// - Returns : The added Item.
    mutating func pop() throws -> Item { /// Logic For pop Operation.
        let lastItem = items.last
        if let lastItem = lastItem{
            items.removeLast()
            return lastItem
        }
        else {
            throw StackError.stackUnderflow
        }
    }
    
    var count : Int {
        items.count
    }
}

/// Structure to demonstrate the stack Operation
struct StackStructure<Value> : Stack {
    typealias Item = Value
    var maxSize: Int = 10000
    var items: [Value] = []
    init() {}
    init(maxSize: Int) {
        self.maxSize = maxSize
    }
}

var stack = StackStructure<Int>(maxSize: 2)


do{
    try stack.push(21)
    try stack.push(33)
    try stack.push(23)
}
catch {
    print(error)
}

stack.count

do{
    try stack.pop()
    try stack.pop()
    try stack.pop()
}
catch {
    print(error)
}

stack.count
