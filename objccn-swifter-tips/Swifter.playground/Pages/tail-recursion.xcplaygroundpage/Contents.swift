
import Foundation

func sum(_ n: UInt) -> UInt {
    if n == 0 {
        return 0
    }
    return n + sum(n - 1)
}

sum(4)
sum(100)


func tailSum(_ n: UInt) -> UInt {
    func sumInternal(_ n: UInt, current: UInt) -> UInt {
        if n == 0 {
            return current
        } else {
            return sumInternal(n - 1, current: current + n)
        }
    }
    
    return sumInternal(n, current: 0)
}

// 两者在 Playground 中都会崩溃。
// 请在实际项目中的 Release build 下尝试
//sum(1000000)
//tailSum(1000000)
