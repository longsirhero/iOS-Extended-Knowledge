import UIKit

let array = ["Apples", "Peaches", "Plums"]

for item in array.reversed() {
    print("Found \(item)")
}

// 也可以通过附加方法调用来反转枚举数组
for (index, item) in array.reversed().enumerated() {
    print("Found \(item) at position \(index)")
}

for (index, item) in array.enumerated().reversed() {
    print("Found \(item) at position \(index)")
}

// array.reversed().enumerated() \ array.enumerated().reversed() 数据一样, 下标结果不一样






