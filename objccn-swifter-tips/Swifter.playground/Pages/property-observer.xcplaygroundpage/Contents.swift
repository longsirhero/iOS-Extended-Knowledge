
import Foundation

class MyClass {
    
    let oneYearInSecond: TimeInterval = 365 * 24 * 60 * 60
    
    var date: NSDate {
        willSet {
            let d = date
            print("即将将日期从 \(d) 设定至 \(newValue)")
        }
        
        didSet {
            if (date.timeIntervalSinceNow > oneYearInSecond) {
                print("设定的时间太晚了！")
                date = NSDate().addingTimeInterval(oneYearInSecond)
            }
            print("已经将日期从 \(oldValue) 设定至 \(date)")
        }
    }
    
    init() {
        date = NSDate()
    }
}

let foo = MyClass()
foo.date = foo.date.addingTimeInterval(10086)

// 输出
// 即将将日期从 2014-08-23 12:47:36 +0000 设定至 2014-08-23 15:35:42 +0000
// 已经将日期从 2014-08-23 12:47:36 +0000 设定至 2014-08-23 15:35:42 +0000

// 365 * 24 * 60 * 60 = 31_536_000
foo.date = foo.date.addingTimeInterval(100_000_000)

// 输出
// 即将将日期从 2014-08-23 13:24:14 +0000 设定至 2017-10-23 23:10:54 +0000
// 设定的时间太晚了！
// 已经将日期从 2014-08-23 13:24:14 +0000 设定至 2015-08-23 13:24:14 +0000

class A {
    var number :Int {
        get {
            print("get")
            return 1
        }
        
        set {print("set")}
    }
}

class B: A {
    override var number: Int {
        willSet {print("willSet")}
        didSet {print("didSet")}
    }
}

let b = B()
b.number = 0

// 输出
// get
// willSet
// set
// didSet
