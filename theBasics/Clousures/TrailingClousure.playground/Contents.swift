import Foundation

///  Example Of Trailing Clousure

func trailingClosure (char1: Character, char2: Character, closure: (Character, Character) -> () ) {
    closure(char1, char2)
}

trailingClosure(char1: "A", char2: "Z") { char1, char2 in
    var relationship: String = "Strangers"
    if char1 == "A", char2 == "B" {
        relationship = "Friends"
    } else if char1 == "A", char2 == "C" || char1 == "B", char2 == "C" {
        relationship = "Enemies"
    }
    print("\(char1) and \(char2) are \(relationship)")
}
