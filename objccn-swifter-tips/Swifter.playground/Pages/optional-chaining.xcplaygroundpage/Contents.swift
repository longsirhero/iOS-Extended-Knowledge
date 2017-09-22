

import Foundation

class Toy {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Pet {
    var toy: Toy?
}

class Child {
    var pet: Pet?
}

let xiaoming = Child()

let toyName = xiaoming.pet?.toy?.name

if let toyName = xiaoming.pet?.toy?.name {
    // 太好了，小明既有宠物，而且宠物还正好有个玩具
    print(toyName)
}

extension Toy {
    func play() {
        //...
    }
}

xiaoming.pet?.toy?.play()

//let playClosure = {(child: Child) -> () in child.pet?.toy?.play()} //返回值将永远不为 nil
let playClosure = {(child: Child) -> ()? in child.pet?.toy?.play()}

if let result: () = playClosure(xiaoming) {
    print(result)
    print("好开心~")
} else {
    print("没有玩具可以玩 :(")
}
