
import Foundation

enum MyEnum {
    case Value1,Value2,Value3
}


func check(someValue: MyEnum) -> String {
    switch someValue {
    case .Value1:
        return "OK"
    case .Value2:
        return "Maybe OK"
    default:
        // 这个分支没有返回 String，也能编译通过
        fatalError("Should not show!")
    }
}

class MyClass {
    func methodMustBeImplementedInSubclass() {
        fatalError("这个方法必须在子类中被重写")
    }
}

class YourClass: MyClass {
    override func methodMustBeImplementedInSubclass() {
        print("YourClass 实现了该方法")
    }
}

class TheirClass: MyClass {
    func someOtherMethod() {
        
    }
}

YourClass().methodMustBeImplementedInSubclass()
// YourClass 实现了该方法

TheirClass().methodMustBeImplementedInSubclass()
// 这个方法必须在子类中被重写
