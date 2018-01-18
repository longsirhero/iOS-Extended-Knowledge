

import Foundation

func incrementor1(variable: Int) -> Int {
    return variable + 1
}

let a = incrementor1(variable: 4)

func incrementor2(variable: Int) -> Int {
    var num = variable
    num += 1
    return num
}

var luckyNumber = 7
let newNumber = incrementor2(variable: luckyNumber)
// newNumber = 8

print(luckyNumber)
// luckyNumber 还是 7

func incrementor3(variable: inout Int) {
    variable += 1
}

luckyNumber = 7
incrementor3(variable: &luckyNumber)

print(luckyNumber)
// luckyNumber = 8

func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
    func incrementor(variable: inout Int) -> () {
        variable += addNumber;
    }
    return incrementor;
}

var input = 10
let incrementor = makeIncrementor(addNumber: 2)
incrementor(&input)
print(input)
