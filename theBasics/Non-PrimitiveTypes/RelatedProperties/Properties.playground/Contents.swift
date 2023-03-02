import Foundation

/// #Properties
/// There are many types of properties :
/// 1. Strored Property
/// Example Struct for Stored Property
struct TwoDimensionalPoint {
    var xAxis : Double // Stored property
    var yAxis : Double = 2.2 // Stored Property with default Value
}

var aPoint = TwoDimensionalPoint(xAxis: 10, yAxis: 20) // yAxis : Alters the value 2.2 -> 20

/// #2. Computer Property
/// We can compute the value of the property according to other conditions or logic.
/// Example Structure to Show Computer Property
struct Seats {
    let rows : Int
    let columns : Int
    
    var seatNumber : Int { // Computer Property
        rows * columns // The logic to set the value for seatNumber
    }
}

/// #3. Lazy Property
/// Function to demonstrate Music Meta Data getter Function
func getMusicMetaData(with songName: String) -> MusicMetaData {
    return MusicMetaData(name: songName, baseUrl: URL(fileURLWithPath: "/\(songName).mp3"), albumArt: URL(fileURLWithPath:"/\(songName)AlbumArt.png"), playBackTimeMS: 50000)
}
/// Structure to Store Music Meta data
struct MusicMetaData {
    let name : String
    let baseUrl : URL
    let albumArt : URL
    let playBackTimeMS : Double
}
/// Structure store important Details about Music to Import in the UI
struct Music {
    let musicName : String
    let Artist : String
    lazy var musicMetaData = {
        getMusicMetaData(with: musicName)
    }()
}

var aMusic = Music(musicName: "Uyare", Artist: "SomeRandomArtist")
aMusic.musicMetaData

/// #Type Property:
/// Type properties are used to set property which is common to all instance of same type of property
/// We are achieving it through setting the property as static
extension Music {
    static let uploader = "Anshil" // The type property
    
    var accessUploader : String { Music.uploader } // Computed property to access static variable (TypeProperty) through the instance.
}

Music.uploader // using the Type (Music struct)
aMusic.accessUploader // Accessed the static var value (Type Property Value) Through computed property.

/// #Property Observers
/// Property Observers will be never called when we init the Property. (In constructor)
struct Person {
    var name : String {
        willSet{
            print("The name is gonna set as '\(newValue)' by replacing '\(name)'")
        }
        didSet {
            print("The name has been set as '\(name)' by replacing '\(oldValue)'")
        }
    }
}

var aPerson = Person(name: "Anshil")
aPerson.name = "AnshilP"

/// #GETTERS and SETTERS
struct People {
    var firstName : String
    var lastName  : String
    var fullName  : String {
        get {
            return firstName + " " + lastName
        }
        set {
            let splittedName = newValue.split(separator: " ")
            firstName = String(splittedName[0])
            lastName = String(splittedName[1])
        }
    }
}

var aMan = People(firstName: "Anshil", lastName: "P")
print(aMan)
aMan.fullName = "Some Guy"
print(aMan)

/// # PropertyWrapper

@propertyWrapper
struct Capitalized{
    private var text : String = ""

    var wrappedValue : String {
        get {return text}
        set {text = newValue.capitalized}
    }
    
    init(wrappedValue : String){ //NOTE:  We will have to set custom Constructor with type of wrappedValue
        self.wrappedValue = wrappedValue
    }
}

struct Book {
    @Capitalized var bookName : String
}

let aBook = Book(bookName: "some book that i read")
print(aBook.bookName)

/// If we use the property wrapper like this we can easily modify the logic behind the wrapper instead of changing in the main structure property.
/// It will save time and efforts
/// This is why the propertyWrappers are considred as one of the Powerful built-in Feature of swift
/// Another Example Of PropertyWrapper:
/// We can create a wrapper to log the data whenever the data in the property changes, For example:

/// A property wrapper that `logs the change in the value of the property`
@propertyWrapper
struct LogData<Value> {
    private var value : Value?
    
    var wrappedValue : Value {
        get {return value!}
        set {
            // Log the data before changing
            print("The data is changing to \(newValue)")
            value = newValue
        }
    }
    
    init(wrappedValue: Value){
        self.wrappedValue = wrappedValue
    }
}

struct CarData {
    @LogData var carName : String //String Data
    @LogData var price : Double //Double Data
    var someOtherField : String
}

var aCar = CarData(carName: "StingGrey", price: 2_00_000, someOtherField: "SomethingAboutTheCar")
aCar.carName = "Ciaz"
aCar.price = 3_00_000

/// The above structure has properties where it can log the changes its data.
/// Suppose we want to change the logic behaind, How the Logging works, We don't have to Focus on the main Structure instead we can just change the logic in the Wrapper, its safe and faster.
