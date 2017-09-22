
import UIKit

let int: Int = 0
let float: Float = 0.0
let double: Double = 0.0

let intNumber: NSNumber = int as NSNumber
let floatNumber: NSNumber = float as NSNumber
let doubleNumber: NSNumber = double as NSNumber

String(validatingUTF8: intNumber.objCType)
String(validatingUTF8: floatNumber.objCType)
String(validatingUTF8: doubleNumber.objCType)

// 结果分别为：
// {Some "q"}
// {Some "f"}
// {Some "d"}
// 注意，fromCString 返回的是 `String?`




let p = NSValue(cgPoint: CGPoint(x: 3, y: 3))
String(validatingUTF8: p.objCType)
// {Some "{CGPoint=dd}"}

let t = NSValue(cgAffineTransform: .identity)
String(validatingUTF8: t.objCType)
// {Some "{CGAffineTransform=dddddd}"}
