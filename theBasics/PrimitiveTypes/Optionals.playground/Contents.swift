import Foundation

/// Optionals are made Using Enum the Structure of Optional May Look like
///
/// enum Optional<Wrapped> {
///     case .none
///     case .som(Wrapped)
/// }

var exampleOptional = Optional.some(20) //Optional With some value
print(exampleOptional)

exampleOptional = Optional.none
print(exampleOptional) //Optional with nil value

/// Optional Binding :

var someValue : Int? = 2 // Integer Optional with some(2)

if let someValue = someValue { // Variable Shadowing (let someValue is different from var someValue.. which will give more readability and avoid confusions. life time is only within enclosure
    print("Not a Nil value its a some with \(someValue)")
}
else {
    print("Its a nil value, catched here")
}

var someOtherValue : Int? // It will assign Optional.none

if let someOtherValue = someOtherValue {
    print("Not a Nil value its a some with \(someOtherValue)")
}
else {
    print("Its a nil value, catched here")
}

/// Nil coelascing Operator :

var anOptionalNumber : Int?

/// Print vlue if value exist or print a default value, here we are using ternary operator
print(anOptionalNumber != nil ? anOptionalNumber : -1)
/// Swift provides a special type of operator to handle this :
print(anOptionalNumber ?? -1) // As Simple as that, and also this unwraps the number.

/// Forced Unwrapping :

var exampleOptionalInt : Int? = 5
print(exampleOptionalInt) /// If you really sure that the Optional will not ever have Nil as value, You can force unwrap The value
print(exampleOptionalInt!) /// But Note that catching Nil here will cause a non-recoverable Fatal error

