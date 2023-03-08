import Foundation

/// # Custom Queue with Concurrent and sync
/// Runs concurrently, but sync blocks other process and make sure that it ran fully first
/// Runs in main thread to utlize the resources since Main Thread is Idle

let CustomQueue = DispatchQueue(label: "com.customqueue.Concurrent", attributes: .concurrent)

/// Afunction to Demonstrate Sync Custom Queue
func doSyncCustomQueueWithConcurrent() {
    for i in 1...3{
        CustomQueue.sync { // CustomQueue
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

