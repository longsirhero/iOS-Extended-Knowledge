
import Foundation

struct Point {
    let x: Double
    let y: Double
    
    // 存储属性
    static let zero = Point(x: 0, y: 0)
    
    // 计算属性
    static var ones: [Point] {
        return [Point(x: 1, y: 1),
            Point(x: -1, y: 1),
            Point(x: 1, y: -1),
            Point(x: -1, y: -1)]
    }
    
    // 类型方法
    static func add(p1: Point, p2: Point) -> Point {
        return Point(x: p1.x + p2.x, y: p1.y + p2.y)
    }
}

Point.zero

Point.ones

Point.add(p1: Point.zero, p2: Point.ones.first!)

class MyClass1 {
    static var bar: String?
}

protocol MyProtocol {
    static func foo() -> String
}

struct MyStruct: MyProtocol {
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
    // 在 class 中可以使用 class
    class func foo() -> String {
        return "MyClass.foo()"
    }
    
    // 也可以使用 static
    static func bar() -> String {
        return "MyClass.bar()"
    }
}

MyClass.foo()
MyClass.bar()
