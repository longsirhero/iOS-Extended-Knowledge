

import Foundation

@objc protocol OptionalProtocol1 {
    @objc optional func optionalMethod()
}

@objc protocol OptionalProtocol2 {
    @objc optional func optionalMethod()        // 可选
    func necessaryMethod()                // 必须
    @objc optional func anotherOptionalMethod() // 可选
}

class MyClass1: OptionalProtocol1 {
    
}

//class MyClass2: OptionalProtocol2 {
//    func necessaryMethod() {
//        print("Default Implementation")
//    }
//}

class MyClass2: NSObject, OptionalProtocol2 {
    func necessaryMethod() {
        print("Implemented in Class2")
    }
}


protocol OptionalProtocol3 {
    func optionalMethod()        // 可选
    func necessaryMethod()       // 必须
    func anotherOptionalMethod() // 可选
}

extension OptionalProtocol3 {
    func optionalMethod() {
        print("Implemented in extension")
    }
    
    func anotherOptionalMethod() {
        print("Implemented in extension")
    }
}

class MyClass3: OptionalProtocol3 {
    func necessaryMethod() {
        print("Implemented in Class3")
    }
    
    func optionalMethod() {
        print("Implemented in Class3")
    }
}

let obj = MyClass3()
obj.necessaryMethod()
obj.optionalMethod()
obj.anotherOptionalMethod()
