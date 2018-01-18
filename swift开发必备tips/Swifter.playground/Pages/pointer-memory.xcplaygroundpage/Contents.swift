
import Foundation

class MyClass {
    var a = 1
    deinit {
        print("deinit")
    }
}

var pointer: UnsafeMutablePointer<MyClass>!

pointer = UnsafeMutablePointer<MyClass>.allocate(capacity: 1)
pointer.initialize(to: MyClass())

print(pointer.pointee.a)
pointer.deinitialize()
pointer.deallocate(capacity: 1)
pointer = nil

// 输出：
// 1
// deinit

var x:UnsafeMutablePointer<tm>!
var t = time_t()
time(&t)
x = localtime(&t)
x = nil
