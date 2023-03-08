import Foundation

/// # Custom Queue with Serial and Async
/// The thread run serailly without blocking other thread or processes.

let CustomQueue = DispatchQueue(label: "com.customqueue.Serial")

func doAsyncCustomQueueWithSerial() {
    for i in 1...3{
        CustomQueue.async {
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
    doAsyncCustomQueueWithSerial()
        
    print("Just playground things 😅")

    CustomQueue.async {
        for i in 1...3 {
            print("Hola \(i) 🇫🇷")
        }
    }

