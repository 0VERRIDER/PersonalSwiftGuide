import Foundation

/// # Subscripts
struct MeetingRoom {
    let roomNumber : Int
    var occupiedSeats : [Int]
    /// Subsript will check for the seat availability.
    /// Returns `true` if the seat is availavle
    subscript(RequestedSeatNumber: Int) -> Bool {
        get {
            occupiedSeats.contains(RequestedSeatNumber) ? false : true
        }
    }
}

/// meetingRoomeOne  is initiated with roomNumber '1' and occupied Seats [1,2,3,4,5,6]
var meetingRoomOne = MeetingRoom(roomNumber: 1, occupiedSeats: [1,2,3,4,5,6])

/// Lets try doing a logic to book a seat in the meetingRoomOne
/// A function to Book seats of MeetingRoom
///
///- Parameters:
/// - seatNumber : seatNumber
/// - in : meetingRoom
///
func book(seatNumber: Int, in meetingRoom : inout MeetingRoom) {
    if meetingRoom[seatNumber] {
        meetingRoom.occupiedSeats.append(seatNumber)
        print("Seat number '\(seatNumber)' has been booked Meeting Room \(meetingRoom.roomNumber).")
    }
    else {
        print("Seat Already booked.")
    }
}

book(seatNumber:  3, in: &meetingRoomOne)
book(seatNumber: 10, in: &meetingRoomOne)
book(seatNumber: 10, in: &meetingRoomOne)

/// #Type Subscripts
extension MeetingRoom {
    static subscript(someKey1 : Int, someKey2: String) -> String {
        return "Key1 : \(someKey1) and Key2 : \(someKey2)"
    }
}
MeetingRoom[2,"hi"]

/// Lets see another Example :

class Vehicle {
    /// Static variable to store the Vehicle data with Vehicle Id as the Key
    static var vehicleById : [String: Vehicle] = [:]

    var name : String
    var id : String
    
    init(name : String, id : String){
        self.name = name
        self.id = id
    }
    
    /// Subscript to access the Vehicle object using the VehicleId
    class subscript(id : String) -> Vehicle? {
        get{
            if let vehicle = vehicleById.first(where: {$0.key == id}){
                return vehicle.value
            }
            else {
                return nil
            }
        }
    }
}

var vehicle1 = Vehicle(name: "Swift", id: "KL71AB2020")
var vehicle2 = Vehicle(name: "Honda", id: "TN71AB2020")

/// Adding data to the static vehicleById dictionary
Vehicle.vehicleById[vehicle1.id] = vehicle1
/// Adding data to the static vehicleById dictionary
Vehicle.vehicleById[vehicle2.id] = vehicle2
/// Accessing Data using the subscript we created.
Vehicle["TN71AB2020"]?.name



