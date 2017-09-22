
import Foundation

let url = NSURL(string: "ht tp://swifter。tips")
print(url ?? "Error")

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
                case "一": number = 1
                case "二": number = 2
                case "三": number = 3
                case "四": number = 4
                case "五": number = 5
                case "六": number = 6
                case "七": number = 7
                case "八": number = 8
                case "九": number = 9
                case "零": number = 0
                default: return nil
                }
            }
            
            self = self + number * Int(pow(10, Double(digit)))
            digit = digit - 1
        }
    }
}

let number1 = Int(fromString: "12")
// {Some 12}

let number2 = Int(fromString: "三二五")
// {Some 325}

let number3 = Int(fromString: "七9八")
// {Some 798}

let number4 = Int(fromString: "吃了么")
// nil

let number5 = Int(fromString: "1a4n")
// nil
