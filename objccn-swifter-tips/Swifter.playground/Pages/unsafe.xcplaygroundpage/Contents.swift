
import Foundation

func method(_ num: UnsafePointer<CInt>) {
    print(num.pointee)
}

// Swift
var a: CInt = 123
method(&a)    // 输出 123

let arr = NSArray(object: "meow")
let str = unsafeBitCast(CFArrayGetValueAtIndex(arr, 0), to: CFString.self)
// str = "meow"
