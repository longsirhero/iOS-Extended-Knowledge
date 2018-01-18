
import Foundation

protocol Food { }

protocol Animal {
    associatedtype F: Food
    func eat(_ food: F)
}

struct Meat: Food { }
struct Grass: Food { }

struct Tiger: Animal {
    func eat(_ food: Meat) {
        print("eat \(food)")
    }
}

let meat = Meat()
Tiger().eat(meat)

struct Sheep: Animal {
    func eat(_ food: Grass) {
        print("eat \(food)")
    }
}

//func isDangerous(animal: Animal) -> Bool {
//    return false
//}

func isDangerous<T: Animal>(animal: T) -> Bool {
    if animal is Tiger {
        return true
    } else {
        return false
    }
}

isDangerous(animal: Tiger())
isDangerous(animal: Sheep())