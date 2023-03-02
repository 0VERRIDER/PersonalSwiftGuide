import Foundation

/// Alarm Delegate Protocol
protocol AlarmDelegate : AnyObject {
    func ringAlarm()
}

class Alarm {
    /// to accept the delegate
     weak var delegate : AlarmDelegate?
    
    func start() {
        delegate?.ringAlarm()
    }
}

class Person : AlarmDelegate {
    var name : String
    
    func ringAlarm() {
        print("\(name) Wake Up !!!")
    }
    
    init(name : String){
        self.name = name
    }
}
/// Created Instance for Alarm
let alarm = Alarm()
/// Created instance for person1
let person1 = Person(name: "Anshil")
/// Passed the person1 instance to the delegate
alarm.delegate = person1
///Started the Alarm
alarm.start()

