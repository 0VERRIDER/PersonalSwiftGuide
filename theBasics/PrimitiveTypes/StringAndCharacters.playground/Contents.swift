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

/// Reference: https://developer.apple.com/documentation/swift/string
///A string is a series of characters, such as "Swift", that forms a collection. Strings in Swift are Unicode correct and locale insensitive, and
///are designed to be efficient. The String type bridges with the Objective-C class NSString and offers interoperability with C functions that
///works with strings.

/// Example of String :

var aString : String = "Hello, World!"

var anotherString = """

                         ZZZZZZZZZZZZZZZ   ZZZZZZZZZZZZZZZ   ZZZZ       ZZZZ   ZZZZZZZZZZZZZZZ
                         ZZZZZZZZZZZZZZZ   ZZZZZZZZZZZZZZZ   ZZZZ       ZZZZ   ZZZZZZZZZZZZZZZ
                               ZZZZZZZ     ZZZZ       ZZZZ   ZZZZ       ZZZZ   ZZZZ       ZZZZ
                              ZZZZZZZ      ZZZZ       ZZZZ   ZZZZZZZZZZZZZZZ   ZZZZ       ZZZZ
                            ZZZZZZZZ       ZZZZ       ZZZZ   ZZZZZZZZZZZZZZZ   ZZZZ       ZZZZ
                           ZZZZZZZZ        ZZZZ       ZZZZ   ZZZZ       ZZZZ   ZZZZ       ZZZZ
                         ZZZZZZZZZZZZZZZ   ZZZZZZZZZZZZZZZ   ZZZZ       ZZZZ   ZZZZZZZZZZZZZZZ
                         ZZZZZZZZZZZZZZZ   ZZZZZZZZZZZZZZZ   ZZZZ       ZZZZ   ZZZZZZZZZZZZZZZ

                                         CAB SERVICES | POWERED BY SHERMAN

   """ // Multiline String

print(anotherString)

/// String Interpolation

let priceOfPen = 20

var theScentence = "My pen is worth of \(priceOfPen)"

/// Addition of string
var andScentence = " and I have 10 of them."

let totalScentence = theScentence + andScentence

// String Comparison

totalScentence == theScentence + andScentence

/// Since the strings are maintained using Unicode in swift String is not Indexable directly, we will have to make subString to Access the part of string.
///
/// The apple Documentation says :
/// ```A string is a collection of extended grapheme clusters, which approximate human-readable characters. Many individual characters, such as “é”, “김”, and “🇮🇳”, can be made up of multiple Unicode scalar values. These scalar values are combined by Unicode’s boundary algorithms into extended grapheme clusters, represented by the Swift Character type. Each element of a string is represented by a Character instance.```
///
///Example:
let fullName = "Anshil P"
let firstSpaceIndex = fullName.firstIndex(of: " ") ?? fullName.endIndex
// Here We are finding the psuedo index of first space (rawBits: 393479).

let firstName = fullName[..<firstSpaceIndex]
// Characters Before the firstSpaceIndex
let lastName = fullName[firstSpaceIndex...]



print("\n--------- Convert String to Character Array -----------\n")

/// Extract characters from  the String :

var arrayOfCharacters = Array(firstName)
print(arrayOfCharacters)

arrayOfCharacters[0].describe // Type : Character and with a size of 128

/// Convert Array of Characters to String ;
String(arrayOfCharacters).describe // String Type with Size 128


print("\n--------- Views in different Encodings -----------\n")
let testString = "Hi there 😄"

///  Unicode Scalars View
testString.unicodeScalars.count
print(Array(testString.unicodeScalars))
print(Array("😄".unicodeScalars))

/// UTF-8 View
testString.utf8.count
print(Array(testString.utf8))
print(Array("😄".utf8))

/// UTF-16 View
testString.utf16.count
print(Array(testString.utf16))
print(Array("😄".utf16))

/// Constructors Of String
print("\n------Constructors Of String-------\n")
///
/// Constructor to Create empty String
/// - Parameter :  None
/// - Returns : Returns Empty String() or ""

let emptyString = String()

/// Constructor to Convert character to String
/// Declared as `init(_ c: Character)`
let aCharacter = Character("A")
let charToString = String(aCharacter)

/// Constructor to convert Sequence of characters to a string
/// Declared as : `init<S>(_ characters: S) where S : Sequence, S.Element == Character`

let aCharacterArray = Array("Some Example Text")

/// Constructor to Convert Substring to String
/// Declared as : `init(_ substring: Substring)`

let subString = "Hi there".split(separator: " ")[0]
subString.describe // Type SubString, Size: 256

let subStringToString = String(subString)
subStringToString.describe // Type String with Size: 128

/// Constructor to create String by repeating String
/// Declared as  : `init(repeating repeatedValue: String, count: Int)`
let repeatedString = String(repeating: "Hi ", count: 10)
print(repeatedString)

/// Constructor to create String by Repeated Character
/// Declared as : `init( repeating repeatedValue: String, count: Int )`

let repeatedCharacterString = String(repeating: Character("A"), count: 10)
print(repeatedCharacterString)

/// Constructor to create String with format
/// Decalared as: `init(format: String,_ arguments: CVarArg...)`

let penPrice = 10
let bookPrice = 30
let stringWithDefinedFormat = String(format:"Price of the pen is %d and book is %d",penPrice,bookPrice)

//TODO: Builtin String Functions







