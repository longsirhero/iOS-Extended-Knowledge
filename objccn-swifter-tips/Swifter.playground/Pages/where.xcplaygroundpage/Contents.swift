
import Foundation

let name = ["王小二","张三","李四","王二小"]

name.forEach {
    switch $0 {
    case let x where x.hasPrefix("王"):
        print("\(x)是笔者本家")
    default:
        print("你好，\($0)")
    }
}

// 输出：
// 王小二是笔者本家
// 你好，张三
// 你好，李四
// 王二小是笔者本家

let num: [Int?] = [48, 99, nil]

let n = num.flatMap {$0}
for score in n where score > 60 {
    print("及格啦 - \(score)")
}
// 输出：
// 及格啦 - Optional(99)

num.forEach {
    if let score = $0, score > 60 {
        print("及格啦 - \(score)")
    } else {
        print(":(")
    }
}
// 输出：
// :(
// 及格啦 - 99
// :(

let sortableArray: [Int] = [3,1,2,4,5]
let unsortableArray: [Any?] = ["Hello", 4, nil]

sortableArray.sorted()

//unsortableArray.sorted()

