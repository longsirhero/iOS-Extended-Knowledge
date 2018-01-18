
import Foundation

let str1 = "快乐的字符串"
let str2 = "快乐的字符串"
let str3 = "开心的字符串"

str1 == str2  // true
str1 == str3  // false

class TodoItem {
    let uuid: String
    var title: String
    
    init(uuid: String, title: String) {
        self.uuid = uuid
        self.title = title
    }
}

extension TodoItem: Equatable {
    
}

func ==(lhs: TodoItem, rhs: TodoItem) -> Bool {
    return lhs.uuid == rhs.uuid
}
