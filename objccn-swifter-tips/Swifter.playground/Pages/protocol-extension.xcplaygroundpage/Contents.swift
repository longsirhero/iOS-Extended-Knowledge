
import Foundation

protocol MyProtocol {
    func method()
}

extension MyProtocol {
    func method() {
        print("Called in extension")
    }
}

//struct MyStruct: MyProtocol {
//    
//}
//MyStruct().method()
//// 输出：
//// Called in extension

struct MyStruct: MyProtocol {
    func method() {
        print("Called in struct")
    }
}
MyStruct().method()
// 输出：
// Called in struct

protocol A1 {
    func method1() -> String
}

struct B1: A1 {
    func method1() -> String {
        return "hello"
    }
}

let b1 = B1()
b1.method1()

let a1: A1 = B1()
a1.method1()

protocol A2 {
    func method1() -> String
}

extension A2 {
    func method1() -> String {
        return "hi"
    }
    
    func method2() -> String {
        return "hi"
    }
}

struct B2: A2 {
    func method1() -> String {
        return "hello"
    }
    
    func method2() -> String {
        return "hello"
    }
}

let b2 = B2()

b2.method1()
b2.method2()

let a2 = b2 as A2

a2.method1()


a2.method2()

