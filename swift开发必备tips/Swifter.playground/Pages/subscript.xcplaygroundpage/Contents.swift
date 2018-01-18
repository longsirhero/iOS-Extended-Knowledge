
import Foundation

var arr = [1,2,3]
arr[2]            // 3
arr[2] = 4        // arr = [1,2,4]

var dic = ["cat":"meow", "goat":"mie"]
dic["cat"]          // {Some "meow"}
dic["cat"] = "miao" // dic = ["cat":"miao", "goat":"mie"]

extension Array {
    subscript(input: [Int]) -> ArraySlice<Element> {
        get {
            var result = ArraySlice<Element>()
            for i in input {
                assert(i < self.count, "Index out of range")
                result.append(self[i])
            }
            return result
        }
        
        set {
            for (index,i) in input.enumerated() {
                assert(i < self.count, "Index out of range")
                self[i] = newValue[index]
            }
        }
    }
}

arr = [1,2,3,4,5]
arr[[0,2,3]]            //[1,3,4]
arr[[0,2,3]] = [-1,-3,-4]
arr                     //[-1,2,-3,-4,5]
