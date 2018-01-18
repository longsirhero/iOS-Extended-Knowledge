
import Foundation

func test(_ arr: [Int]) {
    for i in arr {
        print(i)
    }
}

var a1 = [1,2,3]
var b1 = a1
let c1 = b1
test(a1)

var a2 = [1,2,3]
var b2 = a2
b2.append(5)
// 此时 a 和 b 的内存地址不再相同

class MyObject {
    var num = 0
}

var myObject = MyObject()
var a3 = [myObject]
var b3 = a3

b3.append(myObject)

myObject.num = 100
print(b3[0].num)   //100
print(b3[1].num)   //100

// myObject 的改动同时影响了 b3[0] 和 b3[1]
