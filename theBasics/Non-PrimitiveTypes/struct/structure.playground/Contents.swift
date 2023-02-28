import Foundation

///Structures are Value types to group values together and Store for future use
///For example:

///Example Struct to Store Address
struct Address {
    let firstLine : String //first line of address
    let secondLine : String // second line of address
    let city : String // City name
    let district : String // District
    let state : String // State
    let country : String // Country Name
    let postalCode : String // Postal Code
}

///A structure to store Data of person
struct Person {
    var name : String // Name of the person
    var address : Address // Field to store Address
    let age : Int // Field to store age of the person
}

/// Instance of Person structure
let addressOfPerson = Address(firstLine: "Perunkulon(H)", secondLine: "Masjid Road, Thurakkal", city: "Manjeri", district: "Malappuram", state: "Kerala", country: "India", postalCode: "676121")

/// This is a value type instance means, the variable holds the value nit the reference
var person = Person(name: "Anshil", address: addressOfPerson, age: 21)
person.name
/// For Example :

///made copy of person to person2, this is copy by value

var person2 = person
person2.name

person2.name = "Changed Name" /// Which means  this won't affect the root instance
person2.name // Prints: `Changed Name`
person.name // Prints: `Anshil`

/// From this we can understand that structure is a value type instance
///  Note to Point :
///         1. Structures are value types.
///         2. Inheritance is not possible with Structures.
///         3. You can't Provide a deinitializer to a structure.
///         4. Structure instances won't participate in ARC.
///         5. Type casting is not possible.









