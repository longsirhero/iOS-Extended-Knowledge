import UIKit

func swap<T>(_ a: inout T,  b: inout T) {
    (a, b) = (b, a)
}

var a = 100
var b = 200
swap(&a, &b)

print("a=\(a), b=\(b)")


var turple = ("wingching", "yip")
turple.0 = "mao"


