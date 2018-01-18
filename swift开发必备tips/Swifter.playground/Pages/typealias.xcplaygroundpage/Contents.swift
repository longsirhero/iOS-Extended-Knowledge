
import UIKit

typealias Location = CGPoint
typealias Distance = Double

func distance(from location: Location,
    to anotherLocation: Location) -> Distance {
        let dx = Distance(location.x - anotherLocation.x)
        let dy = Distance(location.y - anotherLocation.y)
        return sqrt(dx * dx + dy * dy)
}

let origin: Location = Location(x: 0, y: 0)
let point: Location = Location(x: 1, y: 1)

let d = distance(from: origin, to: point)

class Person<T> {}

typealias WorkId = String
typealias Worker = Person<WorkId>

//class Person<T> {}

typealias WorkerGeneric<T> = Person<T>

let w1 = Worker()
let w2 = WorkerGeneric<WorkId>()
