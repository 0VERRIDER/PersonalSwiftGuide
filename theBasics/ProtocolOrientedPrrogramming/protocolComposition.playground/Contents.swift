import Foundation

/// Example Protocol
protocol ExampleProtocol {
    var numberOfStudent : String {get set}
}

/// Example Protocol
protocol ExampleProtocol2 {
    var exampleProperty : String {get set}
}

typealias CombinedProtocol = ExampleProtocol & ExampleProtocol2

struct ExampleStruct : CombinedProtocol {
    
    var numberOfStudent: String
    var exampleProperty: String
    
}


