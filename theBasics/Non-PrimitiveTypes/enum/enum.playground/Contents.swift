import Foundation

/// Enum is a value type datatype
/// Collection of possible data
/// Helps us to reduce errors in default data

enum Directions {
    case north
    case south
    case west
    case east
}

/// SelectedDirection by the user
let selectedDirection = Directions.east

/// Switch to handle the enumeration

switch(selectedDirection){
case .east  : print("Selected Direction : East")
case .west  : print("Selected Direction : West")
case .south : print("Selected Direction : South")
case .north : print("Selected Direction : North")
}

enum LightSwitch : String {
    case on = "Light sOn"
    case off = "Light OFF"
}

let lightSwitchState = LightSwitch.on

switch(lightSwitchState){
    case .on :
    print(LightSwitch.on.rawValue)
    case .off :
    print(LightSwitch.off.rawValue)
    default:
    print("Wrong Selection.")
    
    

}
