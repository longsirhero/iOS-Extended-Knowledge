
import Foundation

class ClassA: NSObject { }
class ClassB: ClassA { }

let obj1: NSObject = ClassB()
let obj2: NSObject = ClassB()

obj1.isKind(of: ClassA.self)    // true
obj2.isMember(of: ClassA.self)  // false

let obj: AnyObject = ClassB()

if (obj is ClassA) {
    print("属于 ClassA")
}

if (obj is ClassB) {
    print("属于 ClassB")
}
