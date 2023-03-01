import Foundation

/// Enum is a value type datatype
/// Collection of possible data
/// Helps us to reduce errors in default data
/// Enums cant add more cases during runtime
/// Enum cases uses LowerCamelCase

enum Directions {
    case north
    case south
    case west
    case east
}

/// SelectedDirection by the user
let selectedDirection = Directions.east

/// Switch to handle the enumeration
switch selectedDirection {
case .east  : print("Selected Direction : East")
case .west  : print("Selected Direction : West")
case .south : print("Selected Direction : South")
case .north : print("Selected Direction : North")
}

/// Enum with rawValues
/// Enum rawValues are immutable during run-time
enum LightSwitch : String {
    case on = "Light On"
    case off = "Light OFF"
}

let lightSwitchState = LightSwitch.on

switch lightSwitchState {
    case .on :
    print(LightSwitch.on.rawValue)
    case .off :
    print(LightSwitch.off.rawValue)
}

// Alias for the Tuple of data
typealias Specification = (speed: Double, capacity: Int)

/// Enum with Associated value
enum VehicleType {
    case suv(Specification)
    case hatchback(Specification)
    case stationVehicle(Specification)
}

// Assigning value to the associative Enum.
let selectedVehicle = VehicleType.suv((speed: 20,capacity: 5))

/// Enum With Case Iterable Protocol
/// No AssoiatedValues
/// allCases will take the all cases in an enum (Property in the CaseIterable Protocol)
/// AllCases -> AssociatedType of Caseiterable Protocol (In Caseiterable Protocol)

enum WeekDays : CaseIterable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

print("There are \(WeekDays.allCases.count) Days in a week.")

type(of: WeekDays.allCases) // Array<WeekDays>.Type

/// Iterating through Array<WeekDays>.Type
/// The Caseiterable helps us to convert the Weekdays into an Iterable array
/// https://www.hackingwithswift.com/example-code/language/how-to-list-all-cases-in-an-enum-using-caseiterable
///
for weekday in WeekDays.allCases {
    print("Today is : \(weekday)")
}


/// We can use the OptionSet Protocol For that, For Example

struct ExampleOptionalSet : OptionSet {
    let rawValue: Int
    
    static let optionOne   = ExampleOptionalSet(rawValue: 1)
    static let optionTwo   = ExampleOptionalSet(rawValue: 2)
    static let optionThree = ExampleOptionalSet(rawValue: 3)
    static let optionFour  = ExampleOptionalSet(rawValue: 4)
    static let optionFive  = ExampleOptionalSet(rawValue: 5)
    static let optionSix   = ExampleOptionalSet(rawValue: 6)
}

let allowedEnumCase : ExampleOptionalSet = [.optionOne,.optionTwo]
allowedEnumCase.contains(.optionFour)

/// Indirect Enums
/// indirect enums comes to place where we have to use the enum as the associative type of the case, this makes recursive enum
/// For example:
//enum MathFunction { /// here there will be an  error generated that " Its recursive enum and its not marked as indirect
//    case numbers(Int,Int)
//    case Addition(MathFunction,MathFunction) // Here we are calling the MathFunction Enum Again in the Assosciative value.
//}
/// Swift enforces the determination od Size of the Value type while compilation itself. Recursive Enum can't Calculate the Size of enums during compile time.
/// This is where we use `indirect` Enums.
/// For Example :
indirect enum TreeNode<T> {
    case leaf(T)
    case branch(TreeNode,TreeNode) // indirect enum since I'm using the TreeNode (The Enum Itself) as the AssociativeValue Type.
}

//"""
//           \/ |    |/
//        \/ / \||/  /_/___/_
//         \/   |/ \/
//    _\__\_\   |  /_____/_
//           \  | /          /
//  __ _-----`  |{,-----------~
//            \ }{
//             }{{
//             }}{
//             {{}
//       , -=-~{ .-^- _
//
//"""

/// Protocol is used to make the generic Function sumLeafValues Addable, If not it will generate an error that it cant add two Generic type elements.
protocol Addable {
    static func +(_ lhs: Self, _ rhs : Self) -> Self /// Protocol helps to add LHS and RHS.
}

//FIXME: This is not a normal to make Int conform to our custom protocol
extension Int : Addable {} // Made Int conforming to Addable, Which is a bad practice.


let tree = TreeNode<Int>.branch(
    .leaf(2),
    .branch(.leaf(3), .leaf(4))
)

func sumLeafValues<T: Addable>(of node: TreeNode<T>) -> T {
    switch node {
    case let .leaf(value):
        return value
    case let .branch(left, right):
        return sumLeafValues(of: left) + sumLeafValues(of: right) // Used a custom Addable Protocol
    }
}

sumLeafValues(of: tree)
