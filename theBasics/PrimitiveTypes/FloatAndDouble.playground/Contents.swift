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

var a : Double = 3.14
a.describe // Size is 64

var b : Float = 3.14
b.describe // Size is 32

// Constructors Of Float and Double
