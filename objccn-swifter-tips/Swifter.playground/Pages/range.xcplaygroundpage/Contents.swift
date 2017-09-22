
import Foundation

for i in 0...3 {
    print(i, terminator: "")
}
//输出 0123

let test = "helLo"
let interval = "a"..."z"
for c in test {
    if !interval.contains(String(c)) {
        print("\(c) 不是小写字母")
    }
}
