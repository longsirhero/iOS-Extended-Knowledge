import UIKit

/// static 和 class 使用场景
// static : class \ struct \ enum \ protocol
// class : class
// 任何时候使用static, 是没有问题的

protocol MyProtocol {
    static func foo() -> String
}

struct MyStruct: MyProtocol {
    static var name : String?
    
    static func foo() -> String {
        return "MyStruct"
    }
}

enum MyEnum: MyProtocol {
    static func foo() -> String {
        return "MyEnum"
    }
}

class MyClass: MyProtocol {
    
    class func foo() -> String {
        return "MyClass.foo()"
    }
    
    // 也可用static
//    static func foo() -> String {
//        return "MyClass.foo()"
//    }
}

