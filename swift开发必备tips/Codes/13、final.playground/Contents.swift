import UIKit

// final : 可以用在class、func 或者 var 前面进行修饰, 表示不允许对该内容进行继承或者重写操作

class Parent {
    
    final var name: String?
    
    final func method() {
        print("开始配置")
        // ... 必要的代码
    }
    
}

class Child: Parent {
    
    
}
