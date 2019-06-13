import UIKit

func doWorkAsync(block: @escaping () -> ()) {
    DispatchQueue.main.async {
        block()
    }
    print("do ...")
}

doWorkAsync {
    print("do work ...")
}


protocol P {
    func work(b: @escaping () -> ())
}

class C: P {
    func work(b: @escaping () -> ()) {
        DispatchQueue.main.async {
            print("in C ..")
            b()
        }
    }
}

let c = C()
c.work {
    
}

