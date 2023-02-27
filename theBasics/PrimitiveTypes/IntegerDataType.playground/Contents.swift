import Foundation

extension Equatable{
    /// To describe the Datatype
    ///
    /// ```
    /// Int.describe()
    /// //returns (Int.Type,64)
    ///```
    ///
    /// - Returns (type , Size)
    ///
    var describe : (Any,size : Int) {
        let size = MemoryLayout.size(ofValue: self) * 8
        let type = type(of: self)
        return (type,size : size)
    }
}

/// Integer Data Type :
///     The size of the Integer Data Type is 32 bytes in 32bit machine and 64 bytes in 64 bit machine
///     There is Unsigned, Signed and Custom size Integers in Swift.

var a : Int = 2
a.describe // I'm using 64 bit machine, So the size will be 64.

/// The Boundary of the Int
Int.max
Int.min

/// Ranges from 0 to 2^63 -1
var b : UInt = 0394
b.describe

/// Ranges from -127 to 127
var c : Int8 = 12
c.describe

/// Converting Integer to Integer
/// init<T>(_ source : T) where T : BinaryInteger
///
/// It returns the value or throws error
///  - Parameters source
///  - Returns value

Int(c)

/// init?<T>(exactly source : T) where T : BinaryInteger
/// - Parameters exactly
/// - Returns optional(value)

Int(exactly: b)

/// init<Other>( clamping source : Other ) where Other : BinaryInteger
///
///  returns the maximum value of the Integer type if the source is outof bound
/// - Parameter clamping
/// - Returns Int

Int8(clamping: a) // a = 50999

/// init<T>(truncateIfNeeded source : T) where T : BinaryInteger
///
/// returns the truncated value
/// suppose we have a 16 bit value
/// 11111111_0000000
/// and we are calling the init for Int8 then it truncates to
/// 0000_0000  - 8 bit value
/// - Parameter truncateIfNeeded
/// - Returns truncatedInteger

let e : Int = 65280 // 11111111_00000000
Int8(truncatingIfNeeded: e) // 00000000

///init(bitpattern x : UInt)
/// - Parameter x
/// - Returns x in the same pattern integer

Int8(bitPattern: UInt8(255)) // does like &+
UInt8(bitPattern: Int8(-1)) // does like &-

/// Convering Floating Point values into Integer
///
///Double into integer
///Converts the value by rounding the specified Double towards Zero

let f = 2.22
f.describe

Int(f)

/// Floating-Point into Integer
/// Converts Floating-Point value into Integer by rounding the value towards zero

let g = Float(3.14)
g.describe

Int(g)

/// Convert to String
/// String Convert to Int
///
///  Uses Scanner class to detect Integer from the String Specified
///
let aString = "92343345678988765"
let scanner = Scanner(string: aString)

// scans Consecutive integer value
// Truncates the value after a series of integers
var aNumber = scanner.scanInt()
aNumber?.describe


/// Type casting, String to Int
///  scanner checks whether it contains any illegal characters ( Non - Numeric)
///   If yes :
///                 Throw Error
///   else :
///   Scanner.scanInt()
///   checks for Overflow
///
///   returns the the Integer using Scanner.scanInt()
///
let anotherNumber : Int? = Int(aString)

/// Int.isMultiple(of : Self)
///
///

let aNum = 2

aNum.isMultiple(of: 2)


