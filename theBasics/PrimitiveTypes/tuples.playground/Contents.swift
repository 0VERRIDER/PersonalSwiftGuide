import Foundation

/// Tuples are collection of values, It can contain hetrogeneous datatypes
/// Tuples treats collection of data as a single data.
/// Non-Continues Memory allocation
///  Behind the Scene Compiler selects Apt data structure to store the data according to the nature of value in the tuple.
///  Tuples are light weight and efficient.
///  But in some situations it is recommented to use Data structures like array, commonely if the number of data is more.

let anExampleTuple = (2,3,"hi")
type(of: anExampleTuple) // (Int, Int, String).Type

/// 1. The common use case of tuple is to group data together and return as single value.
/// Example :

///Function to Demonstrate Fetching Image from a source
///- Parameters:
/// - _ fetched : `true`    or `false`
///- Returns; `(image_urls: [String], count: Int)`

func fetchImages(_ fetched: Bool) -> (image_urls: [String], count: Int){
    if fetched{
        let images = ["imageUrl1", "imageUrl2", "imageUrl3"]
        let count = images.count
        
        return (image_urls: images, count: count) // here we are returning multiple values
    }
    else {
        return (image_urls: [], count: 0)
    }
}

/// Calling the fetchImage()
fetchImages(true)

/// 2. Another use case is destructuring data
let fetchedImageData = fetchImages(true)
fetchedImageData.image_urls
fetchedImageData.count

/// 3. single line variable initialization (Destructuring in another way)
let (a, b) = (20, 40)
a
b

/// 4. Parameter Labelling
typealias Person = (name: String, age: Int) // Type aliasing the tuple.
///Function to demonstrate Parameter labelling using Tuples
///- Parameters :
/// - person:(name: String, age: Int)
///- Returns: (name: String, age: Int)
func returnPersonDetails(person: Person) -> Person {
    // returning directly what we got in paramters
    return person
}

let person = (name: "Anshil P", age: 21) // Person Type data
let returnedPerson = returnPersonDetails(person: person) // Destructuring

returnedPerson.name
returnedPerson.age


