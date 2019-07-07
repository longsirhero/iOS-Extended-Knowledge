import UIKit


// +2
func addTo(_ adder: Int) -> (Int) -> (Int) {
    return { num in
        return adder + num
    }
}

let addTwo = addTo(2)
let result = addTwo(8)

print(result)

func greaterThan(_ comparer: Int) -> (Int) -> Bool {
    return { $0 > comparer}
}

let greaterThan10 = greaterThan(10)

greaterThan10(13)


