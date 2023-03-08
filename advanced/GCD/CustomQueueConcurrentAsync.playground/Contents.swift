import Foundation

/// # Custom Queue with Concurrent and async
/// The process will run concurrently
/// Since its async it won't disturb the execution
///


let CustomQueue = DispatchQueue(label: "com.customqueue.Concurrent", attributes: .concurrent)

/// Afunction to Demonstrate Sync Custom Queue
func doSyncCustomQueueWithConcurrent() {
    for i in 1...3{
        CustomQueue.async { // CustomQueue
            if Thread.isMainThread {
                print("Process is running in the Main Thread.")
            }
            else {
                print("Process is running in different Thread.")
            }
            let imageUrl = URL(string: "https://developer.apple.com/swift/images/swift-og.png")!
            let imageData = try? Data(contentsOf: imageUrl)
            print("Image \(i) has been downloaded.")
        }
    }
}
    doSyncCustomQueueWithConcurrent()
        
    print("Just playground things 😅") // Running in the main Queue

    CustomQueue.async { // Custom Queue
        for i in 1...3 {
            print("Hola \(i) 🇫🇷")
        }
    }

