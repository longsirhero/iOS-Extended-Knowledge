import UIKit

protocol Food {}

struct Meat: Food {}
struct Grass: Food {}

protocol Animal {
    // associatedtype : 有实现协议的类型指定类型
    associatedtype F: Food
    func eat(_ food: F)
}

// 老虎吃肉
struct Tigger: Animal {
    func eat(_ food: Meat) {
        print("eat \(food)")
    }
}

// 羊吃草
struct Sheep: Animal {
    func eat(_ food: Grass) {
        print("eat \(food)")
    }
}
