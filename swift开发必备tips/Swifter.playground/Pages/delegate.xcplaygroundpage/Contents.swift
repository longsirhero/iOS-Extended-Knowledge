
import UIKit

protocol MyClassDelegate: class {
    func method()
}

class MyClass {
    weak var delegate: MyClassDelegate?
}

class ViewController: UIViewController, MyClassDelegate {
    // ...
    var someInstance: MyClass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        someInstance = MyClass()
        someInstance.delegate = self
    }
    
    func method() {
        print("Do something")
    }
    
    //...
}

// weak var delegate: MyClassDelegate? 编译错误
// 'weak' cannot be applied to non-class type 'MyClassDelegate'
