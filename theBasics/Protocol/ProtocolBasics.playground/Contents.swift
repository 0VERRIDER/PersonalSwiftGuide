import Foundation

protocol WinOrLoss{
    var win : Int { get }
    var loss : Int { get }
}

extension WinOrLoss {
    var winPercentage : Double {
        (Double(win) / Double(win + loss)) * 100
    }
}

struct CarRace : WinOrLoss {
    var win: Int
    var loss: Int
    
    var winPercentage : Int {
        (win / (win + loss)) * 100
    }
}

var fastnFurious : CarRace = CarRace(win: 1, loss: 1) //0*100 -- Int
fastnFurious.winPercentage

// Protocol Extension Dispatch
var fastnFurious2 : WinOrLoss = fastnFurious //0.50 * 100 -- Double
fastnFurious2.winPercentage

