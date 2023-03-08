enum QueueError : Error {
    case queueIsEmpty
}

enum StackError : Error {
    case stackUnderFlow
}

protocol Containable {
    associatedtype Item
    
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct Stack<Element>: Containable {
    
    typealias Item = Element
    
    private var items = [Item]()
    
    var count: Int {
        items.count
    }
    
    mutating func push(_ item: Item) {
        items.append(item)
    }
    
    mutating func pop() throws -> Item {
        if count != 0 {
            return items.removeLast()
        }
        else{
            throw StackError.stackUnderFlow
        }
    }
    
    subscript(i: Int) -> Item {
        items[i]
    }
}

struct Queue<Element> : Containable {

    typealias Item = Element
    
    private var items = [Item]()
    
    var count: Int {
        items.count
    }
    
    mutating func enqueue(_ item: Item) {
        items.append(item)
    }
    
    mutating func dequeue() throws -> Item {
        if count != 0 {
            return items.removeFirst()
        }
        else{
            throw QueueError.queueIsEmpty
        }
    }
    
    subscript(i: Int) -> Element {
        items[i]
    }
    
    
}


var stackOfStrings = Stack<String>()

stackOfStrings.push("Hi there")
stackOfStrings.push("hello")

do {
    try stackOfStrings.pop()
    print(stackOfStrings[stackOfStrings.count-1])
    try stackOfStrings.pop()
    try stackOfStrings.pop() // throws error
}
catch{
    print(error)
}
var queueOfTickets = Queue<String>()

queueOfTickets.enqueue("Ticket1")
queueOfTickets.enqueue("Ticket2")

do {
    try queueOfTickets.dequeue()
    try queueOfTickets.dequeue()
    try queueOfTickets.dequeue() // throws error
}
catch{
    print(error)
}

