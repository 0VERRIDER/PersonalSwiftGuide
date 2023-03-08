import Foundation

/// # Dsipatch Group
/// - Helps to Group set of task and manage them all together as a group
///
/// - important Functions are :
///     - enter()
///     - leave()
///     - wait()
///     - notify()

/// Lets do an example Downloader Function using custom thread

let downloaderQueue = DispatchQueue(label: "com.example.Downloader")
let group = DispatchGroup()

func downloader(url fileUrl: String,inBackground: Bool = true, compleation : @escaping (Data?) -> ()){
    group.enter()
    
    if inBackground {
        downloaderQueue.async {
            /// Simulates Downloading Process
            let data = try? Data(contentsOf: URL(string: fileUrl)!)
            compleation(data)
            group.leave()
        }
    }
    else {
        downloaderQueue.sync {
            /// Simulates Downloading process
            let data = try? Data(contentsOf: URL(string: fileUrl)!)
            compleation(data)
            group.leave()
        }
    }
}

/// Lets say its a required downloader of supporting files (not in background)...
downloader(url: "https://support.oneskyapp.com/hc/en-us/article_attachments/202761627/example_1.json",inBackground: false){
    data in
    if data != nil {
        print("Main Data has been Downloaded.")
    }
    else{
        print("Couldn't Fetch the Data.")
    }
}

/// Download Few not very important files in background
downloader(url: "https://developer.apple.com/swift/images/swift-og.png"){
    data in
    if data != nil {
        print("Data has been Downloaded.")
    }
    else{
        print("Couldn't Fetch the Data.")
    }
}

downloader(url: "https://developer.apple.com/swif/images/swift-og.png"){
    data in
    if data != nil {
        print("Data has been Downloaded.")
    }
    else{
        print("Couldn't Fetch the Data.")
    }
}

downloader(url: "https://developer.apple.com/swift/images/swift-og.png"){
    data in
    if data != nil {
        print("Data has been Downloaded.")
    }
    else{
        print("Couldn't Fetch the Data.")
    }
}

/// To wait till th group done all the tasks we can use the wait()

//group.wait()


/// Triggeres when all of the DispatchGroupFunctions are done
group.notify(queue: downloaderQueue){
    print("All Downloading tasks has been finished")
}

/// main queue operation otside our custom DownloaderQueue
print("Some of the Main Code...")
