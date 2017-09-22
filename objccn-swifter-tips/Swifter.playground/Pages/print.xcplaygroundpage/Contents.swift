
import Foundation

class MyClass {
    var num: Int
    init() {
        num = 1
    }
}

let obj = MyClass()
print(obj)

struct Meeting {
    var date: NSDate
    var place: String
    var attendeeName: String
}

let meeting = Meeting(date: NSDate(timeIntervalSinceNow: 86400),
    place: "会议室B1",
    attendeeName: "小明")
print(meeting)
// 输出:
// Meeting(date: 2015-08-10 03:15:55 +0000, place: "会议室B1", attendeeName: "小明")

extension Meeting: CustomStringConvertible {
    var description: String {
        return "于 \(self.date) 在 \(self.place) 与 \(self.attendeeName) 进行会议"
    }
}

