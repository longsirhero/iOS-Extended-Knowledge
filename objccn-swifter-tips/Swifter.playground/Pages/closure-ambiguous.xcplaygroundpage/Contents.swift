
import Foundation

extension Int {
    func times(f: (Int) -> ()) {
        print("Int")
        for i in 1...self {
            f(i)
        }
    }
}

3.times { (i: Int) -> () in
    print(i)
}
// 输出：
// Int
// 1
// 2
// 3

3.times { i in
    print(i)
}
// 输出：
// Int
// 1
// 2
// 3


//extension Int {
//    func times(f: Void -> Void) {
//        print("Void")
//        for i in 1...self {
//            f()
//        }
//    }
//}
// Swift 1.2 之前：
// 输出：
// Void
//
//
//
// Swift 1.2 之后由于歧义，无法编译

//extension Int {
//    func times(f: (Int, Int) -> ()) {
//        print("Tuple")
//        for i in 1...self {
//            f(i, i)
//        }
//    }
//}
// 注释掉开头的 times(f: Int -> ())
// 3.times { i in
//   print(i)
// }
// 输出为
// Tuple
// (1, 1)
// (2, 2)
// (3, 3)

