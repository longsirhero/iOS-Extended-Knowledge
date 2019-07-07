import UIKit

@objc protocol OptionalProtocol {
    @objc optional func optionalMethod()
    
    func necessaryMethod()
}

/// “一个不可避免的限制是，使用 @objc 修饰的 protocol 就只能被 class 实现了，也就是说，对于 struct 和 enum 类型，我们是无法令它们所实现的协议中含有可选方法或者属性的。另外，实现它的 class 中的方法还必须也被标注为 @objc，或者整个类就是继承自 NSObject。这对我们写代码来说是一种很让人郁闷的限制。”

/// protocol extension
protocol OptionalProtocolExtent {
    func optionMethod()  // 可选
    func necessaryMethod() // 必须
}

extension OptionalProtocolExtent {
    func optionMethod() {
        print("....")
    }
}


