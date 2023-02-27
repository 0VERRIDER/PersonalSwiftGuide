import Foundation
/// Once the value is set Constant will never allow you to change the value
/// When constant get a value to the memory location compiler makes the memory location into Read Only.
///Which gives alot of memory management capacity and also will liverage the memory management.

/// let - Instructs the compiler to treat it like a constant
/// `exampleConstant` - is the constant name
/// Int - Specifies the DataType
/// 2 is the value to be stored.
/// As soon as exampleConstant gets a value compiler makes the memory location as readOnly.
let exampleConstant : Int = 2

/// Compiler is ready to strore a string value and make the memory location read only
let anotherConstant : String

/// Compiler got the value, Now the compiler will keep the memory location as read only.
anotherConstant = "Hi,There"

/// Since Compiler made it read only here there will be an error
//anotherConstant = "Hello, there"

/// The process of creating a constant in Swift compiler may look like :
///  1. Allocates memory for requested dataType and returns the address to the memory location (let's say `exampleConstant`)
///  2. When compiler gets a value assigned to `exampleConstant`, compiler stores the value and makes it as read only memory.


/// Variable is like a container of data, you can change and access when ever you need.
/// Lifetime of a variable is depennded on the plaace where it is declared or the type of data.

/// var - Instructs the Compiler that its a variable
/// `exampleVariable` - the variable name
///  Int - Data type
///   `2` - Value to be stored
var exampleVariable : Int = 2
///We can change
exampleVariable = 4
/// and access Variable when ever we need.
print(exampleVariable)


/// Type Interference
/// Swift can Implicity understand types automatically
/// For Example:

var typeInterferenceExample = 2
/// Compiler sets the datatype during lexical and semantic analysis automatically for us, This can improve readability of code
type(of: typeInterferenceExample)

/// Look at another example with a constant
///
let typeInterferenceContant = "Hola 🇫🇷"
type(of: typeInterferenceContant)







