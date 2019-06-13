import UIKit

extension Int {
    init?(fromString: String) {
        self = 0
        var digit = fromString.count - 1
        for c in fromString {
            var number = 0
            if let n = Int(String(c)) {
                number = n
            } else {
                switch c {
                case "一":
                    number = 1
                default:
                    return nil
                }
            }
            self = self + number * Int(pow(10, Double(digit)))
            digit = digit - 1
        }
    }
}


let number1 = Int(fromString: "12")

let number2 = Int(fromString: "三二五")

let number3 = Int(fromString: "一")

