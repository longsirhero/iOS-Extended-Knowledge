
import UIKit

UIView.animate(withDuration: 0.3,
    delay: 0.0,
    options: [.curveEaseIn, .allowUserInteraction],
    animations: {},
    completion: nil)

struct YourOption: OptionSet {
    let rawValue: UInt
    static let none = YourOption(rawValue: 0)
    static let option1 = YourOption(rawValue: 1)
    static let option2 = YourOption(rawValue: 1 << 1)
    //...
}

YourOption.option1

[YourOption.option1, YourOption.option2]
