
import Foundation

class MyClass {
    var a: Int = 1
    func method() {
        a = a * 100000
        a = a * 100000
        a = a * 100000
        print(a)
    }
}

MyClass().method()

// 64 位环境 (iPhone 5s 及以上)
// 1,000,000,000,000,000

// 32 位环境 (iPhone 5c 及以下)
// 崩溃

//func method() {
//    var max = Int.max
//    max = max + 1
//}

var max = Int.max
max = max &+ 1

// 64 位系统下
// max = -9,223,372,036,854,775,808
