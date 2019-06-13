import UIKit

struct Vector2D {
    var x = 0.0
    var y = 0.0
}

func +(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let v1 = Vector2D(x: 0.0, y: 0.0)
let v2 = Vector2D(x: 100.0, y: 100.0)
let addResult = v1 + v2
print(addResult)

// precedencegroup: 定义一个操作符的优先级
precedencegroup DotProductPrecedence {
    // 定义了结合律
    associativity: none
    
    // 定义了运算符的优先级
    higherThan: MultiplicationPrecedence
}

// infix : 表示要定义的是一个中位操作符, 即前后都是输入
infix operator +*: DotProductPrecedence

func +*(left: Vector2D, right: Vector2D) -> Double {
    return left.x * right.x + left.y * right.y
}

let result = v1 +* v2
print(result)

