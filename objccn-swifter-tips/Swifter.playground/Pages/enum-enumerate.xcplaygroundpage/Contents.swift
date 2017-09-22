
import Foundation

enum Suit: String {
    case spades = "黑桃"
    case hearts = "红桃"
    case clubs = "草花"
    case diamonds = "方片"
}

enum Rank: Int, CustomStringConvertible {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    var description: String {
        switch self {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default:
            return String(self.rawValue)
        }
    }
}

protocol EnumeratableEnum {
    static var allValues: [Self] {get}
}

extension Suit: EnumeratableEnum {
    static var allValues: [Suit] {
        return [.spades, .hearts, .clubs, .diamonds]
    }
}

extension Rank: EnumeratableEnum {
    static var allValues: [Rank] {
        return [.ace, .two, .three,
            .four, .five, .six,
            .seven, .eight, .nine,
            .ten, .jack, .queen, .king]
    }
}

for suit in Suit.allValues {
    for rank in Rank.allValues {
        print("\(suit.rawValue)\(rank)")
    }
}

// 输出：
// 黑桃A
// 黑桃2
// 黑桃3
// ...
// 方片K
