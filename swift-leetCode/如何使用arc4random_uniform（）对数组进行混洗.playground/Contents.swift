import UIKit

extension Array {
   mutating func customShuffle()  {
        for i in 0 ..< (count - 1) {
            let j = Int(arc4random_uniform(UInt32(count
             - i))) + i
            swapAt(i, j)
        }
    }
}

var array = ["yyq", "wc", "xiaoming", "xiaohong", "xiaoxiao"]
array.customShuffle()
print(array)

// 使用自带的shuffle() 和 shuffled() 方法, 和使用arc4ramdom_uniform()类似
