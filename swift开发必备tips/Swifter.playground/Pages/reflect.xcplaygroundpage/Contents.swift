
import Foundation

struct Person {
    let name: String
    let age: Int
}

let xiaoMing = Person(name: "XiaoMing", age: 16)
let r = Mirror(reflecting: xiaoMing) // r 是 MirrorType

print("xiaoMing 是 \(r.displayStyle!)")

print("属性个数:\(r.children.count)")

for child in r.children {
    print("属性名:\(String(describing: child.label))，值:\(child.value)")
}

//for i in r.children.startIndex..<r.children.endIndex {
//    print("属性名:\(r.children[i].0!)，值:\(r.children[i].1)")
//}

// 输出：
// xiaoMing 是 Struct
// 属性个数:2
// 属性名:name，值:XiaoMing
// 属性名:age，值:16

dump(xiaoMing)
// 输出：
// ▿ Person
//  - name: XiaoMing
//  - age: 16

func valueFrom(_ object: Any, key: String) -> Any? {
    let mirror = Mirror(reflecting: object)
    
    for child in mirror.children {
        let (targetKey, targetMirror) = (child.label, child.value)
        if key == targetKey {
            return targetMirror
        }
    }
    
    return nil
}

// 接上面的 xiaoMing
if let name = valueFrom(xiaoMing, key: "name") as? String {
    print("通过 key 得到值: \(name)")
}

// 输出：
// 通过 key 得到值: XiaoMing
