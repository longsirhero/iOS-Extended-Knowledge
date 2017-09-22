import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class MyClass: NSObject {
    @objc dynamic var date = Date()
}

class MyClass1: NSObject {
    var date = Date()
}

class MyChildClass: MyClass1 {
    @objc dynamic override var date: Date {
        get { return super.date }
        set { super.date = newValue }
    }
}

private var myContext = 0

class Class: NSObject {
    
    var myObject: MyClass!
    
    override init() {
        super.init()
        myObject = MyClass()
        print("初始化 Class，当前日期: \(myObject.date)")
        myObject.addObserver(self,
         forKeyPath: ("date"),
            options: .new,
            context: &myContext)

        delay(1) {
            self.myObject.date = Date()
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                            of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                              context: UnsafeMutableRawPointer?)
    {
        if let change = change, context == &myContext {
            if let newDate = change[.newKey] as? Date {
                print("Class 日期发生变化 \(newDate)")
            }
        }
    }
}

_ = Class()


class AnotherClass: NSObject {
    var myObject: MyClass!
    var observation: NSKeyValueObservation?
    override init() {
        super.init()
        myObject = MyClass()
        print("初始化 AnotherClass，当前日期: \(myObject.date)")
        observation = myObject.observe(\MyClass.date, options: [.new]) { (_, change) in
            if let newDate = change.newValue {
                print("AnotherClass 日期发生变化 \(newDate)")
            }
        }
        
        delay(1) { self.myObject.date = Date() }
    }
}

delay(2) {
    _ = AnotherClass()
}
