
import Foundation

func myMethod(anObj: AnyObject!) {
    objc_sync_enter(anObj)
    
    // 在 enter 和 exit 之间持有 anObj 锁
    
    objc_sync_exit(anObj)
}

func synchronized(_ lock: AnyObject, closure: () -> ()) {
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
}

func myMethodLocked(anObj: AnyObject!) {
    synchronized(anObj) {
        // 在括号内持有 anObj 锁
    }
}

// 一个实际的线程安全的 setter 例子
class Obj {
    var _str = "123"
    var str: String {
        get {
            return _str
        }
        set {
            synchronized(self) {
                _str = newValue
            }
        }
    // 下略
    }
}
