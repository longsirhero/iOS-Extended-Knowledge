import UIKit

func incrementor(variable: inout Int) -> Int {
    variable += 1
    return variable
}

var luckyNumber = 7
let newNumber = incrementor(variable: &luckyNumber)
print(luckyNumber, newNumber)





