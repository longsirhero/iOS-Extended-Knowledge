
import UIKit

class Drinking {
    typealias LiquidColor = UIColor
    var color: LiquidColor {
        return .clear
    }
    
    class func drinking(name: String) -> Drinking {
        var drinking: Drinking
        switch name {
        case "Coke":
            drinking = Coke()
        case "Beer":
            drinking = Beer()
        default:
            drinking = Drinking()
        }
        
        return drinking
    }
}

class Coke: Drinking {
    override var color: LiquidColor {
        return .black
    }
}

class Beer: Drinking {
    override var color: LiquidColor {
        return .yellow
    }
}

let coke = Drinking.drinking(name: "Coke")
coke.color // Black

let beer = Drinking.drinking(name: "Beer")
beer.color // Yellow


let cokeClass = NSStringFromClass(type(of: coke)) //Coke

let beerClass = NSStringFromClass(type(of: beer)) //Beer
