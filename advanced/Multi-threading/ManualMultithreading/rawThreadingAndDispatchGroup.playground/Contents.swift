import Foundation


/// # Manual Multithreading and DispatchGroup


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
    
    let group = DispatchGroup()
    
    var task : (String) -> ()
    /// Initializer to set the thread name
    init(name: String, task : @escaping (String) -> ()) {
        self.task = task
        super.init()
        self.name = name
    }
    
    ///Override the start to add the thread to dispatch group
    override func start() {
        super.start()
        group.enter()
    }
    
    /// main function of the created thread
    override func main() {
        task(Thread.current.name!)
        group.leave()
    }
    
    /// This function waits till the current thread gets executed completly
    func join(){
        group.wait()
    }
    
    deinit{
        print("Thread Ended")
    }
}

/// Thread to run example backgroundTask
let backgroundThread = CustomThread(name: "BackgroundTask",task: backgroundTask)
/// Start the backgroundThread
backgroundThread.start()

/// Calling join on background to execute the whole background thread before starting foregroundThread
backgroundThread.join()

/// Thread to run example foregroundTask
let foregroundThread = CustomThread(name: "ForegroundTask", task: foregroundTask)
///Start foregroundThread
foregroundThread.start()



