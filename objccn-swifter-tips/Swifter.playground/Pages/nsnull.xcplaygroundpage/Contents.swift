
import Foundation

// 假设 jsonValue 是从一个 JSON 中取出的 NSNull
let jsonValue: AnyObject = NSNull()

if let string = jsonValue as? String {
    print(string.hasPrefix("a"))
} else {
    print("不能解析")
}

// 输出：
// 不能解析
