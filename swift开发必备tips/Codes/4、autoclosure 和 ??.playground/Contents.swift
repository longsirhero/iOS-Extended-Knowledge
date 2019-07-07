import UIKit

func logIfTrue(_ predicate: () -> Bool) {
    if predicate() {
        print("True")
    }
}

logIfTrue { () -> Bool in
    return 100 > 200
}

logIfTrue({ return 100 > 200 })

logIfTrue({ 100 > 200 })

func log2IfTrue(_ predicate: @autoclosure () -> Bool) {
    if predicate() {
        print(" log2IfTrue True")
    }
}

log2IfTrue(2 > 1)

