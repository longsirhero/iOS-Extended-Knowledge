
import Foundation

// 先定义一个实现了 IteratorProtocol 协议的类型
// IteratorProtocol 需要指定一个 typealias Element
// 以及提供一个返回 Element? 的方法 next()
class ReverseIterator<T>: IteratorProtocol {
    typealias Element = T
    
    var array: [Element]
    var currentIndex = 0
    
    init(array: [Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    
    func next() -> Element? {
        if currentIndex < 0{
            return nil
        }
        else {
            let element = array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
}

// 然后我们来定义 Sequence
// 和 IteratorProtocol 很类似，不过换成指定一个 typealias Iterator
// 以及提供一个返回 Iterator? 的方法 makeIterator()
struct ReverseSequence<T>: Sequence {
    var array: [T]
    
    init (array: [T]) {
        self.array = array
    }
    
    typealias Iterator = ReverseIterator<T>

    func makeIterator() -> ReverseIterator<T> {
        return ReverseIterator(array: self.array)
    }
}

let arr = [0,1,2,3,4]

// 对 Sequence 可以使用 for...in 来循环访问
for i in ReverseSequence(array: arr) {
    print("Index \(i) is \(arr[i])")
}


var iterator = arr.makeIterator()
while let obj = iterator.next() {
    print(obj)
}

let aaa = ReverseSequence(array: arr)
aaa.map { (Int) -> Int in
    return 1
}

