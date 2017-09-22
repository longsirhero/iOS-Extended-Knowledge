
import Foundation

@objc(MyClass)
class 我的类: NSObject {
    @objc(greeting:)
    func 打招呼(名字: String) {
        print("哈喽，\(名字)")
    }
}

我的类().打招呼(名字: "小明")