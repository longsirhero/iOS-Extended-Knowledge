import UIKit

typealias Location = CGPoint
typealias Distance = Double

func distance(from location: Location, to anotherLocation: Location) -> Distance {
    let dx = Distance(location.x - anotherLocation.x)
    let dy = Distance(location.y - anotherLocation.y)
    return sqrt(dx * dx + dy * dy)
}

let origin: Location = Location(x: 0, y: 0)
let point: Location = Location(x: 1, y: 1)

let d: Distance = distance(from: origin, to: point)
print(d)

protocol Cat {}

protocol Dog {}

typealias Pat = Cat & Dog






