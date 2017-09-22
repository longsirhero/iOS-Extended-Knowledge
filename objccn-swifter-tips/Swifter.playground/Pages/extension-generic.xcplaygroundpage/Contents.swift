
import Foundation

extension Array {
    var random: Element? {
        return self.count != 0 ?
            self[Int(arc4random_uniform(UInt32(self.count)))] :
        nil
    }
    
    func appendRandomDescription
        <U: CustomStringConvertible>(_ input: U) -> String {
            
            if let element = self.random {
                return "\(element) " + input.description
            } else {
                return "empty array"
            }
    }
}

let languages = ["Swift","ObjC","C++","Java"]
languages.random!
// 随机输出是这四个字符串中的某个

let ranks = [1,2,3,4]
ranks.random!
// 随机输出是这四个数字中的某个

languages.appendRandomDescription(ranks.random!)
// 随机组合 languages 和 ranks 中的各一个元素，然后输出
