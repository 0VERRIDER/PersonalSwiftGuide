import Foundation

/// # This how we can create custom queue
///
/// the initializer of DispatchQueue is
///
/// DispatchQueue.init(label: String, qos: DispatchQoS, attributes: DispatchQueue.Attributes, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency, target: DispatchQueue?)

/// Defult queue type is Serial
/// Default target is Global Queue

let aQueue = DispatchQueue(label: "A")

/// to create a queueu with concurrent
let bQueue = DispatchQueue(label: "Bqueue", attributes: .concurrent)
/// Attributes:
///     - .concurrent
///     - .initiallyInactive


/// # Target Queue
/// Thread Where the Actual Excution happens
/// To Join two thread operations
/// To change QoS of a thread
/// Example ;
let b = DispatchQueue(label: "B", attributes: .concurrent, target: aQueue) // Even though the queue attribute has been set to  `concurrent` it will work in `serial` way, because of the target `aQueue`

aQueue.async {
    for i in 1...5 {
        print(i)
    }
}

aQueue.async {
    for i in 6...10{
        print(i)
    }
}

b.async {
    for i in 11...16 {
        print(i)
    }
}

b.async {
    for i in 17...20 {
        print(i)
    }
}


/// Setting a target in run time
/// Note:  You can only set the target when your thread is not active.

let anotherQueue = DispatchQueue(label: "AnotherQueue", attributes: [.concurrent,.initiallyInactive]) // the Queue is concurrent and inactive
anotherQueue.setTarget(queue: aQueue) // Target has been set

anotherQueue.async {
    print("anotherQueue isActive") // it will Only dispatch only if the thread is active.
}

anotherQueue.activate() // We have activated the Queue

