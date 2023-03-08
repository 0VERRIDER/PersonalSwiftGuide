import Foundation


/// # Manual Multithreading
/// We can achieve multithreading manually using the Thread class.
/// - We get all of the features and power of and over the threads
/// But we will have to manage everything from the scratch. Which is more error-prone and also difficult to do.
/// We usually go for the Modules/APIs like GCD or Operations to manage threads.

/// But to understand the basic concept of Multithreading we can try out the Raw Threading using Thread class

/// A dummy background task Function
typealias TaskType = (String) -> ()

func backgroundTask(_ threadName: String) {
    for i in 1...10 {
        print("\(threadName) task running: \(i)")
        sleep(1) // Sleep for 1 second
    }
}

/// A dummy foreground task
func foregroundTask(_ threadName: String) {
    for i in 1...5 {
        print("Its a\(i > 1 ? "nother" : "") Foreground Task.")
        sleep(1)
    }
}



/// A custom class Overriding the Thread class
class CustomThread : Thread {
    var task : (String) -> ()
    /// Initializer to set the thread name
    init(name: String, task : @escaping TaskType) {
        self.task = task
        super.init()
        self.name = name
    }
    
    /// main function of the created thread
    override func main() {
        task(Thread.current.name!)
    }
    
    deinit{
        print("Thread Ended")
    }
}

/// Thread to run example backgroundTask
let backgroundThread = CustomThread(name: "BackgroundTask",task: backgroundTask)
/// Start the backgroundThread
backgroundThread.start()

/// Thread to run example foregroundTask
let foregroundThread = CustomThread(name: "ForegroundTask",task: foregroundTask)
///Start foregroundThread
foregroundThread.start()



