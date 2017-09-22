
import Foundation

let a = 3;
let b = 1.234567  // 我们在这里不去区分 float 和 Double 了
let c = "Hello"
print("int:\(a) double:\(b) string:\(c)")
// 输出：
// int:3 double:1.234567 string:Hello

let format = String(format:"%.2f",b)
print("double:\(format)")
// 输出：
// double:1.23

extension Double {
    func format(_ f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}

let f = ".2"
print("double:\(b.format(f))")
