import Foundation

/// # Global Current Queues
/// - System Created Queue
/// - Concurrent In nature
/// - It doesn't use Main Thread for execution
/// - Priorities can be set using QoS

DispatchQueue.global(qos: .userInteractive).async { // The most prior QoS
    print("Global with userInterative")
}

DispatchQueue.global(qos: .background).async { // The least prior QoS
    print("Global with background")
}

DispatchQueue.global(qos: .userInitiated).async { // Qos Comes after userInteractive
    print("Global with userInitiated")
}

DispatchQueue.global(qos: .utility).async { // little more important than background
    print("Global with utility")
}

DispatchQueue.global(qos: .default).async { // In between  User initiated and Utility
    print("Global with default QoS")
}

DispatchQueue.global(qos: .unspecified).async { // Unspecified prior QoS
    print("Global with unspecified QoS")
}
