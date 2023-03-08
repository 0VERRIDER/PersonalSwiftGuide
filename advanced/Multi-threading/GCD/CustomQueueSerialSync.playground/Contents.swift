import Foundation

/// # Custom Queue with Serial and Sync
/// Sync blocks other processes and only continues after the sync tasks are over.
/// ## Note: The Sync Process is running in the Main Thread instead of running another thread.
/// Which was contradiction to  our concepts, where custom queues will never run in main thread
/// But when its sync the main thread will be idle, Swift runs the sync process (Conditionally) in main thread to utlize the resources

let CustomQueue = DispatchQueue(label: "com.customqueue.Serial")

/// Afunction to Demonstrate Sync Custom Queue
func doSyncCustomQueueWithSerial() {
    for i in 1...3{
        CustomQueue.sync {
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
    doSyncCustomQueueWithSerial()
        
    print("Just playground things 😅")

    CustomQueue.async {
        for i in 1...3 {
            print("Hola \(i) 🇫🇷")
        }
    }

