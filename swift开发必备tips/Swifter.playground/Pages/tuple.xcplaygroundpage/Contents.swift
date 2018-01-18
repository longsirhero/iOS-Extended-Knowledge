
import UIKit

func swapMe1<T>( a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

func swapMe2<T>( a: inout T, b: inout T) {
    (a,b) = (b,a)
}

var a = 1
var b = 2

(a, b)
swapMe1(a: &a, b: &b)
(a, b)


swapMe2(a: &a, b: &b)
(a, b)

let rect = CGRect(x: 0, y: 0, width: 100, height: 100)

let (small, large) = rect.divided(atDistance: 20, from: .minXEdge)

small
large

