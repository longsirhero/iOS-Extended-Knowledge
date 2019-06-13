import UIKit

extension Array {
    subscript(input: [Int]) -> ArraySlice<Element> {
        get {
            var result = ArraySlice<Element>()
            for i in input {
                assert(i < self.count, "Index out od range")
                result.append(self[i])
            }
            return result
        }
        set {
            for (index, i) in input.enumerated() {
                assert(i < self.count, "Index out of range")
                self[i] = newValue[index]
            }
        }
    }
}

var arr = [0, 1, 2, 3, 4, 5]
print(arr[[2, 4]])
arr[[0, 3, 4]] = [100, 200 ,300]
print(arr)


