import UIKit

protocol Vehicle {
    var numberOfWheels: Int {get}
    
    var color: UIColor {get set}
    
    mutating func changeColor()
}

struct MyCar: Vehicle {
    var numberOfWheels: Int = 4
    
    var color: UIColor = UIColor.blue
    
    mutating func changeColor() {
        color = .red
    }
}


