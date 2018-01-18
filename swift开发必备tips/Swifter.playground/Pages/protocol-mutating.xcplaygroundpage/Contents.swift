
import UIKit

protocol Vehicle
{
    var numberOfWheels: Int {get}
    var color: UIColor {get set}
    
    mutating func changeColor()
}

struct MyCar: Vehicle {
    let numberOfWheels = 4
    var color = UIColor.blue
    
    mutating func changeColor() {
        color = .red
    }
}

var car = MyCar()
car.color

car.changeColor()
car.color


