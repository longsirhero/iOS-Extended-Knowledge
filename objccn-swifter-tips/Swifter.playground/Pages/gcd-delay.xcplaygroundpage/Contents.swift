
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// 创建目标队列
let workingQueue = DispatchQueue(label: "my_queue")


// 派发到刚创建的队列中，GCD 会负责进行线程调度

workingQueue.async {
    // 在 workingQueue 中异步进行
    print("努力工作")
    Thread.sleep(forTimeInterval: 2)  // 模拟两秒的执行时间
    
    DispatchQueue.main.async {
        // 返回到主线程更新 UI
        print("结束工作，更新 UI")
    }
}

let time: TimeInterval = 2.0
DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) { 
    print("2 秒后输出")
}

import Foundation

typealias Task = (_ cancel : Bool) -> Void

func delay(_ time: TimeInterval, task: @escaping ()->()) ->  Task? {
    
    func dispatch_later(block: @escaping ()->()) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    
    
    
    var closure: (()->Void)? = task
    var result: Task?
    
    let delayedClosure: Task = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    
    return result;
    
}

func cancel(_ task: Task?) {
    task?(true)
}

delay(2) { print("2 秒后输出") }

let task = delay(5) { print("拨打 110") }

// 仔细想一想..
// 还是取消为妙..
cancel(task)


