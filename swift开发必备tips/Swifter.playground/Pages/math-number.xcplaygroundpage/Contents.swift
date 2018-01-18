
import Foundation

func circlePerimeter(radius: Double) -> Double {
    return 2 * M_PI * radius
}

func yPosition(dy: Double, angle: Double) -> Double {
    return dy * tan(angle)
}

1.797693134862315e+308 < Double.infinity  // true
1.797693134862316e+308 < Double.infinity  // false

let a = 0.0 / 0.0
let b = sqrt(-1.0)
let c = 0.0 * Double.infinity

let num = Double.nan
if num == num {
    print("Num is \(num)")
} else {
    print("NaN")
}

// 输出：
// NaN

if num.isNaN {
    print("NaN")
}
// 输出：
// NaN
