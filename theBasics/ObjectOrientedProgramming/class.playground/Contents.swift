import Foundation

/// Structure to Store Address
struct Address {
    let buildingNumber : Int
    let buldingName : String
    let city : String
    let district : String
    let state : String
    let country : String
    let pinCode : String
}

/// A class to Store BankBranch Details
class BankBranch {
    static var bankName : String = "SBI Bank"
    var branchName : String
    var IFSC : String
    var branchUserCapacity : Int
    var branchAddress : Address
    /// Constructor
    init(branchName: String, IFSC: String, branchUserCapacity: Int, branchAddress: Address){
        self.branchName = branchName
        self.IFSC = IFSC
        self.branchUserCapacity = branchUserCapacity
        self.branchAddress = branchAddress
    }
    /// Deconstructor
    deinit{
        print("BankBranch has been Deinitialized.")
    }
    
    func BankName(){
        BankBranch.bankName
    }
}

