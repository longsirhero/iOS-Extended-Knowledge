
import Foundation

let arr = [1,2,3]
let doubled = arr.map{
    $0 * 2
}

print(doubled)
// 输出：
// [2,4,6]

let num: Int? = 3
let result = num.map {
    $0 * 2
}

result
// result 为 {Some 6}