
import Foundation

class ClassA {
    lazy var str: String = {
        let str = "Hello"
        print("只在首次访问输出")
        return str
    }()
}

print("Creating object")
let obj = ClassA()

print("Accessing str")
obj.str

print("Accessing str again")
obj.str

let data1 = 1...3
let result1 = data1.map {
    (i: Int) -> Int in
    print("正在处理 \(i)")
    return i * 2
}

print("准备访问结果")
for i in result1 {
    print("操作后结果为 \(i)")
}

print("操作完毕")


let data2 = 1...3
let result2 = data2.lazy.map {
    (i: Int) -> Int in
    print("正在处理 \(i)")
    return i * 2
}

print("准备访问结果")
for i in result2 {
    print("操作后结果为 \(i)")
}

print("操作完毕")
