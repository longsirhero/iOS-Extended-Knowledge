import UIKit

// 检查数组中所有项是否与条件匹配: allSatisfy()
let result = [1, 2, 3, 4, 10].allSatisfy{ $0 < 10}
print("数组内的值是否都小于10: \(result)")

let sWords = ["Swift", "Seahorse", "Solar"]
let allMath = sWords.allSatisfy { $0.hasPrefix("S")}
print("数组内的值是否都以“s”开头: \(allMath)")

// ceil(x)返回不小于x的最小整数值（然后转换为double型）。
let a = 1.192313121
let c = ceil(a)

let d = Int(ceil(a))

// floor(x)返回不大于x的最大整数值。
let e = floor(0.99999)

// round(x)返回x的四舍五入整数值。
let f = round(0.499999)

// 如果你想保留默认初始值设定项和你自己的自定义初始化程序，那么有一个简单的技巧：在扩展中创建初始化程序而不是作为主结构定义的一部分。
struct Person {
    var firstName: String
    var lastName: String
}

extension Person {
    init(name: String) {
        let split = name.components(separatedBy: " ")
        firstName = split.first ?? ""
        lastName = split.last ?? ""
    }
}

let taylor1 = Person(firstName: "Taylor", lastName: "Swift")
let taylor2 = Person(name: "Taylor Swift")

// 如何将相关值添加到枚举
// 创建一个Weather可以存储各种天气类型的枚举：晴天，阴天，刮风和下雨。然而，这并没有真正描述这些条件 - 它有多云？大风强风还是微风？雨肯定会发生，还是一个相当遥远的机会？
enum Weather {
    case sunny
    case cloudy(coverage: Int)
    case windy(speed: Int)
    case rainy(chance: Int)
}

let london = Weather.cloudy(coverage: 90)
let gusty = Weather.windy(speed: 10)
let guaranteedRain = Weather.rainy(chance: 100)

// 如何将原始值添加到枚举
enum Planets: Int {
    case mercury = 1 // 从1开始向上计数
    case venus
    case earth
    case mars
}

//enum Planets: String {
//    case mercury = "mercury"
//    case venus = "venus"
//    case earth = "earth"
//}

// 如何使用#warning和#error在代码中添加警告和错误
func encrypt(_ string: String, with password: String) -> String {
    #warning("This is bad method of encryption")
    return password + String(string.reversed()) + password
}

#if os(macOS)
#error("MyLibrary is not supported on macOS.")
#endif

// #warning主要用于提醒自己或他人某些工作不完整。Xcode模板通常用于#warning标记您应该用自己的代码替换的方法存根。可以认为它就#warning像是一个FIXME自动显示在构建输出中的注释。
// #error如果您运送的库需要其他开发人员提供一些数据，则它们非常有用。例如，Web API的身份验证密钥 - 您希望用户包含他们自己的密钥，因此使用#error将强制他们在继续之前更改该代码。


// 如何s将一个数组附加到另一个数组
var first = ["John", "Paul"]
var second = ["George", "Ringo"]
first.append(contentsOf: second)

first += second

// 如何使用带标签的语句打破多个循环级别
let numbers = 1...100
// 注意循环outerLoop:之前for number1，以及匹配break outerLoop- 这将导致两个循环一旦找到正确的数字就退出。
outerLoop: for number1 in numbers {
    for number2 in numbers {
        if number1 == number2 && number1 * number2 == 144 {
            print("Square found: \(number1)")
            break outerLoop
        }
    }
}

// 如何在编译时检查swift版本
#if swift(>=4.2)
print("Running Swift 4.2 or later")
#else
print("Running old Swift")
#endif

// 如何检查日期是否在日期范围内
// 每个人都知道你可以用两个整数来创建范围1...5，但很少有人意识到这同样适用于日期。这意味着您可以使用您已知的相同闭区域运算符（...）和半开程运算符（..<）创建日期范围，从而可以检查一个日期是否位于范围内
let now = Date()
let soon = Date().addingTimeInterval(5000)
let later = Date().addingTimeInterval(10000)

let range = now...later
if range.contains(soon) {
    print("The date is inside the range")
} else {
    print("The date is outside the range")
}


/// 如何使用canImport() 检查模块是否可用
#if canImport(UIKit)
// iOS, tvOS, and watchOS - use UIColor
#elseif canImport(AppKit)
// macOS - use NSColor
#else
// all other platforms - use a custom color object
#endif

// 之前canImport()我们需要使用#if os(macOS), 使用canImport()是一种改进，因为它可以让您专注于您想要的功能而不是操作系统

/// 如何使用precondition（）检查程序状态
// 您应该已经知道该assert()函数可以让您在运行时检查程序的状态，如果事情不是这样的话，则会崩溃。其中一个assert()很好的功能是，当你在发布模式下构建你的应用程序时会自动删除它，但如果你不希望这种情况发生 - 如果你想要你的应用程序崩溃，如果出现严重错误 - 那么你应该使用precondition()功能而不是。
// precondition()与以下内容完全相同assert()：如果检查失败，请给它一个检查条件以及要打印的可选消息。在运行时 - 即使在发布模式下 - Swift将为您运行检查并在检查失败时崩溃。
let users = ["xiaoming", "Petter", "Jack"]
precondition(users.count > 0, "There must be at least one user")

/// 如何比较日期
let newNow = Date()
let newSoon = Date().addingTimeInterval(5000)
newNow == newSoon
newNow != newSoon
newNow < newSoon
newNow > newSoon

/// 如何遵守Comparable协议

// 该Comparable协议允许用使用<，>，<=，和>=与符合数据类型，而这又意味着，swift知道如何那些类型的数组进行排序操作符。Swift的大多数内置类型都支持Comparable开箱即用，但如果你想让你自己的类型符合它们，那么你需要实现<- 从Swift可以提供其他三个运算符的默认实现。
struct PersonCompara: Comparable {
    var name: String
    static func <(lhs: PersonCompara, rhs: PersonCompara) -> Bool {
        return lhs.name < rhs.name
    }
}

// 有了这个你可以用<来比较这俩个实例Person
let taylor = PersonCompara(name: "Taylor Swift")
let justin = PersonCompara(name: "Justin Bieber")
print(taylor < justin)

/// 如何遵守Equatable协议
// Equatable协议允许使用两个对象进行比较 ==
struct PersonEquat: Equatable {
    var name: String
    var age: Int
    
    static func ==(lhs: PersonEquat, rhs: PersonEquat) -> Bool{
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}
let jack = PersonEquat(name: "jack", age: 23)
let mary = PersonEquat(name: "mary", age: 50)
print(jack == mary)

/// 如何约束协议关联类型
// 迫使ID符合Hashable
protocol Identifiable {
    associatedtype ID: Hashable
    var id: ID {get set}
}

/// 如何将字符串转换为data
let data = Data("yyq".utf8)

/// NSMakeRange -> Range
let input = "Hello, World"
let rangenew = NSMakeRange(0, 10)

let swiftRange = Range(rangenew, in: input)

/// 如何使用Codable将JSON转换为swift对象
// Swift的Codable协议可以很容易地将JSON转换为本机Swift结构和类 - 只需设计与JSON保持相同键和值的数据类型，然后用于JSONDecoder转换。
let jsonString = """
[
    {
    "name": "Taylor Swift",
    "age": 26
    },
    {
    "name": "Justin Bieber",
    "age": 25
    }
]
"""
let jsonData = Data(jsonString.utf8)
// 我们需要创建一个可以容纳这些字段的匹配Swift结构。唯一的要求Codable是结构中的所有属性也符合Codable- 在我们的例子中，它是一个字符串和一个整数，所以我们都设置了。
struct PersonCodable: Codable {
    var name: String
    var age: Int
}
let decoder = JSONDecoder()
do {
    let people = try decoder.decode([PersonCodable].self, from: jsonData)
    print(people)
} catch {
    print(error.localizedDescription)
}

/// 如何计算数组中的元素频率
// 如果您有一个包含各种元素的数组，并且您想要计算每个项目出现的频率，则可以通过将该map()方法与Dictionary初始化程序相结合来实现
let items = ["a", "b", "a", "c"]
// 使用元组将其转换为键值对数组，其中每个值都是数字1：
let mappedItems = items.map { ($0, 1) }
print(mappedItems)
// Dictionary从该元组数组创建一个，要求它在每次找到重复键时将1添加到一起：
let counts = Dictionary(mappedItems, uniquingKeysWith: +)
print(counts)

/// 如何计算数组中的匹配项
// 最简单的方法是通过调用运行集合，filter()然后计算总数。
let count = [1, 2, 3, 4, 5].filter { $0 % 2 == 1}.count
// 将其包装在扩展名中Collection
extension Collection {
    func count(where test: (Element) throws -> Bool) rethrows -> Int{
        return try self.filter(test).count
    }
}

/// 如何创建自定义调试说明
struct Player: CustomDebugStringConvertible {
    var name: String = "@twostraws"
    var debugDescription: String {
        return name
    }
}
let player = Player()
print(player)


/// 如何创建具有重复子项的数组
// Swift有一个内置的初始化程序repeating:count:
let numbers1 = [Int](repeating: 0, count: 50)
let numbers2 = [[Int]](repeating: [Int](repeating: 0, count: 50), count: 50)

/// 如何使用Hasher从对象创建哈希值
// 散列值是唯一标识数据的无价方式，任何符合Hashable协议的类型都可以通过使用Hasherstruct 来创建全部或部分散列值。
struct iPad: Hashable {
    var serialNumber: String
    var capacity: Int
}

let firstiPad = iPad(serialNumber: "12345", capacity: 128)
let secondiPad = iPad(serialNumber: "abcde", capacity: 512)

var hasher = Hasher()
hasher.combine(firstiPad)
hasher.combine(secondiPad)
let hash = hasher.finalize()
print("哈希值是:\(hash)")

/// 如何创建多行字符串文字
let longString = """
When you write a string that spans multiple
lines make sure you start its content on a
line all of its own, and end it with three
quotes also on a line of their own.
Multi-line strings also let you write "quote marks"
freely inside your strings, which is great!
"""
print(longString)

/// 如何使用where子句过滤循环
let names = ["Michael Jackson", "Taylor Swift", "Michael Caine", "Adele Adkins", "Michael Jordan"]
// 如果你的where子句中需要多个条件,请使用他们加入&&
for name in names where name.hasPrefix("Michael") {
    print(name)
}

/// 如何找到俩个数组之间的差异
// 如果你有两个包含类似项目的数组，并且想要找出它们之间的差异 - 即哪些项目存在于一个或另一个中，而不是两者都存在 - 最简单的方法是使用a Set。集合有一个symmetricDifference()完全相同的方法，所以你只需要将两个数组转换为一个集合，然后将结果转换回数组。
extension Array where Element: Hashable {
    func  difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
let names1 = ["John", "Paul", "Ringo"]
let names2 = ["Ringo", "Paul", "George"]
let difference = names1.difference(from: names2)

/// 如何在数组中找到第一个匹配元素
let scores = [80, 100, 80, 85]
let firstHigh = scores.first { $0 > 85}

/// 如何在数组中找到最大值, 最小值
// 所有数组都有一个内置的方法max()，它返回数组中的最高项。如果数组的元素符合以下内容，则会带有默认实现Comparable：它将简单地比较所有项，直到找到比较最高的项。
let newnumbers = [1, 2, 3, 4, 5]
let max = newnumbers.max()
let min  = newnumbers.min()

/// 如何查找第一个匹配的数组元素的索引
let numbers3 = [2, 4, 6, 8, 9, 10]
let firstOdd = numbers3.index { $0 % 2  == 1 }
print(firstOdd)

/// 如何在数组中找到最长的初始序列
// Swift的一个鲜为人知的函数是prefix(while:)：在数组上调用它以及要应用的测试，它将从数组的开头返回尽可能多的项目，仅在它到达第一个未通过测试的元素时停止。
let scroresnew = [89, 86, 96, 78, 92, 100]
let initialPasse1 = scroresnew.prefix { $0 > 85 }
print(initialPasse1)

/// 如何找到三个数字中最大的值
//let firstValue1 = 10
//let secondValue1 = 15
//let thirdCValue1 = 18
//let largest = max(max(firstValue1, secondValue1), thirdCValue1)


/// 如何生成随机数
let randomInt = Int.random(in: 1...5)
print(randomInt)
let randomDouble = Double.random(in: 1...10)
print(randomDouble)
let randomFloat = Float.random(in: 1..<10)
print(randomFloat)
let randomBool = Bool.random()
print(randomBool)

/// 如何使用randomElement() 从数组中获取随机元素
let numbersRandom = [100, 80, 85]
if let winner = numbersRandom.randomElement() {
    print("The winning number is \(winner)")
}

/// 如何使用字典对数组进行分组
let singers = ["Ed Sheeran", "Ariana Grande", "Taylor Swift", "Adele Adkins"]
let groupedByLength = Dictionary(grouping: singers) { $0.count }
let groupedByFirst = Dictionary(grouping: singers) { $0.first! }
print(groupedByLength, groupedByFirst)

/// 如何使用CaseIterable列出枚举中的所有案例
// CaseIterable协议，它自动生成枚举中所有情况的数组属性
enum Color: CaseIterable {
    case red, green, blue
}

for color in Color.allCases {
    print("My favorite color is \(color)")
}

// 这种自动合成allCases仅适用于没有关联值的枚举。自动添加它们是没有意义的，但是如果你想要你可以自己添加它：
enum Car: CaseIterable {
    static var allCases: [Car] {
        return [.ford, .toyota, .jaguar, .bmw, .porsche(convertible: false), .porsche(convertible: true)]
    }
    case ford, toyota, jaguar, bmw
    case porsche(convertible: Bool)
}
print(Car.allCases)

/// 如何遍历数组中的非空项
let numbersValue: [Int?] = [1, nil, 3, nil, 5]
for case let number? in numbersValue {
    print(number)
}

/// 函数如何接受可变的参数
func sum(_ numbers: Int...) -> Int{
    return numbers.reduce(0, +)
}
let total = sum(1, 2, 3, 4, 5)

/// 如何使用ExpressibleByStringLiteral从字符串创建自定义类型
// Swift的ExpressibleByStringLiteral协议允许我们直接从字符串创建任何类型 - 只要Swift了解您的意思是什么类型，您就可以创建任何您想要的类型。
extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = URL(string: value)!
    }
}
// 有了这个扩展，您现在可以编写如下代码：
// 请注意，我已经明确标记url为URL类型以便Swift认为它不是常规字符串。
let url: URL = "https://www.baidu.com"
print(url.absoluteString)

/// 如何通过fizz buzz测试
// 这种方法将大的输入空间（任何数字）分解为true和false的简单组合，然后我们在case语句中使用元组模式匹配来选择正确的输出。
func fizzbuzz(number: Int) -> String {
    switch (number % 3 == 0, number % 5 == 0) {
    case (true, false):
        return "Fizz"
    case (false, true):
        return "Buzz"
    case (true, true):
        return "FizzBuzz"
    case (false, false):
        return String(number)
    }
}
print(fizzbuzz(number: 15))

/// 如何从数组中删除第一个或最后一个项目
var numberss = [1, 2, 3, 4, 5]
// popLast 是昂贵的操作
let last1 = numberss.popLast()
print(last1!, numberss)
let last2 = numberss.removeLast()
print(last2, numberss)
let first1 = numberss.removeFirst()
print(first1, numberss)

/// 如何将协议限制为类
// 一些较旧的Swift代码class用于此限制，但AnyObject对于现代Swift来说是正确的。
protocol Authenticatable: AnyObject {
    func authenticate() -> Bool
}

/// 如何反向排序数组
// 1、第一种排序方法
let numbersort = [100, 5, 53, 98, 29]
let reversed1 = Array(numbersort.sorted().reversed())
// 2、 第二种排序方法
let reversed2 = numbersort.sorted { $0 > $1 }
print(reversed2)


/// 如何使用Codable对JSON的键进行排序
let encoder = JSONEncoder()
encoder.outputFormatting = .sortedKeys

/// 如何指定字典键的默认值
var scoresnew = ["Taylor Swift": 25, "Ed Sheeran": 20]
// Adele Adkins 健可能没值, 那么取默认值0
print(scoresnew["Adele Adkins", default: 0])

/// 如何使用Codable和JSONEncoder指定自己的日期格式
let encodernew = JSONEncoder()
let formatter = DateFormatter()
formatter.dateStyle = .full
formatter.timeStyle = .full
encodernew.dateEncodingStrategy = .formatted(formatter)

/// 如何将数组拆分为快
// 将数组分成指定大小的块
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
// 如果数组中的数字为1到100，并且您希望将其拆分，以便有许多数组，每个数组包含五个数字，
let numbersarray = Array(1...100)
let resultarray = numbersarray.chunked(into: 5)
print(resultarray)

/// 如何使用swapAt（）交换数组中的两个项目
var namesnew = ["Paul", "John", "Ringo"]
namesnew.swapAt(0, 1)
print(namesnew)

/// 如何使用字符串抛出错误
extension String: LocalizedError {
    public var errorDescription: String? { return self }
}

// 通过该更改，您现在可以将字符串作为错误抛出，并且它们就像常规错误一样工作。例如，您可以创建一个像这样的抛出函数：
func doDangerousThing() throws {
    throw "i am sorrory, Dave, i can not do that."
}

do {
    try doDangerousThing()
} catch {
    print(error.localizedDescription)
}

/// 如何切换布尔值
// toggle() 更加swift的方法, 真假切换
var loggedIn = false
loggedIn.toggle()
print(loggedIn)

/// 如何使用mapValues()转换字典的值
let peopleMetric = ["Taylor": 178.0, "Justin": 175.0, "Ed": 173.0]
// 如果我们想在不改变键的情况下将这些高度转换为英寸，我们可以mapValues()像这样使用：
let peopleImperial = peopleMetric.mapValues{ $0 / 2.54 }
print(peopleImperial)

/// 如何使用@available来弃用旧的api
// 不推荐使用,但会生成警告,但仍可以调用: deprecated
@available(*, deprecated: 4.0, message: "4.0版本不推荐使用")
func test1() {}

// 完全废弃: obsoleted
@available(swift, obsoleted: 5.0, message: "5.0版本完全废弃不可用")
func test2() {}

// 不推荐使用的版本, 完全废弃的版本
@available(swift, deprecated: 4.0, obsoleted: 5.0, message: "4.0版本不推荐使用, 5.0版本完全废弃")
func test3() {}

// 不推奖使用的版本, 完成废弃的版本, 重命名: rename, 导致Xcode自动生成修复 - 用户可以单击修复以让Xcode为它们执行重命名。
@available(swift, deprecated: 4.0, obsoleted: 5.0, renamed: "attemptConnection")
func testConnection() {}

// 控制何时引入特定的API
@available(swift, introduced: 4.2)
func loadUser() {}
// 通过@available这种方式使用，您的API就像Apple自己的行为一样 - Xcode将通过弃用的方法绘制红线，发出编译警告和错误，甚至根据需要自动生成fix-it。

/// 如何使用#available检查api可用性
// 检查用户是否在其设备上安装了iOS 9.0或更高版本：
if #available(iOS 9, *) {
    // use UIStackView
} else {
    // show sad face emoji
}

// 通过使用将整个函数或类标记为需要特定的iOS版本@available
@available(iOS 9, *)
func useStackView() {
    // use UIStackView
}

/// 如何使用Codable加载和保存自定义数据类型
// Swift 4引入了一种加载和保存数据的新方法，用NSCoding更灵活，更安全，更易于编写的东西替换旧协议：Codable。
// 除非您需要自定义实现，否则只需使您的数据类型符合即可Codable将其保存到属性列表XML或JSON。
// 例如，这是一个符合的自定义结构Codable，以及它的一些实例：
struct Language: Codable {
    var name: String
    var version: Int
}

let swift = Language(name: "Swift", version: 4)
let php = Language(name: "PHP", version: 7)
let perl = Language(name: "Perl", version: 6)

// 通过这一个很小的一致性，我们可以将它转换Data为JSON 的表示形式，如下所示：
let encoder0 = JSONEncoder()
if let encoder1 = try? encoder0.encode(swift) {
    if let json = String(data: encoder1, encoding: .utf8) {
        print(json)
    }
    let decoder = JSONDecoder()
    if let decoder = try? decoder.decode(Language.self, from: encoder1) {
        print(decoder)
    }
    
}

/// 如何使用compactMap（）转换数组
// compactMap 转换数组, 任何nil值都被丢弃
let compactNumbers = ["1", "2", "Fish"]
let integers = compactNumbers.compactMap { Int($0) }
print(integers)

/// 如何使用编译器指令来检测iOS模拟器
#if targetEnvironment(simulator)
    // your code, 只在模拟器中运行的代码
#endif

func updateMotion() {
#if targetEnvironment(simulator)
    // we're on the simulator - calculate pretend movement
#else
    // we're on a device – use the accelerometer
    if let accelerometerData = motionManager.accelerometerData {
        physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.y * -50, dy: accelerometerData.acceleration.x * 50)
    }
#endif
}

/// 如何使用带有可选值的flatMap（）
// 选项的flatMap()方法允许您转换可选项（如果它有值），或者如果它是空的则不执行任何操作。与常规解包相比，这使得代码更短，更具表现力，并且不需要您更改数据类型。
// 使用flatMap()with optionals与使用类似map()，但有一个重要的区别：如果你的转换闭包返回一个可选的，flatMap()将把该可选项与现有的可选项组合在一起，而map()将两者保持一致。
// 这是一个实际的例子，你可以看到差异：
let stringNumber: String? = "5"
// intNumber将是Int??一个可选的可选整数。
let intNumber = stringNumber.map { Int($0) }
print(intNumber)
// flatMapNumber是一个常规的Int?, 意味着整个事物存在或不存在 - 它更容易使用。
let flatMapNumber = stringNumber.flatMap { Int($0) }
print(flatMapNumber)

/// 如何使用map() 转换数组
let nums = [1, 2, 3, 4, 5]
let doubled = nums.map { $0 * 2}

/// 如何使用带有可选值的map（）
// 选项的map()方法允许您转换可选项（如果它有值），或者如果它是空的则不执行任何操作
let namemap: String? = "twostraws"
let twitterName = namemap.map { "@\($0)"}
print(twitterName)

/// 如何使用Mirror来检查类型数据
// Swift有一个内置的Mirror结构，可以让我们在代码中查询任何类型的数据。它最常用于读取可用属性列表，但它也用于游乐场中打印出类型内的用户可读值。
struct Personnew{
    var name = "Taylor Swift"
    var age = 26
}
var taylor3 = Personnew()
var mirror = Mirror(reflecting: taylor3)
// 可以遍历内部的所有属性taylor并打印出它们的名称和值，如下所示：
for case let (label, value) in mirror.children {
    print(label, value)
}

/// 如何使用forEach方法遍历数组
// 与for循环的区别, 区别在于forEach()不能跳过任何项目 - 您无法在不处理其余项目的情况下退出循环部分。这有助于人们阅读您的代码来弄清楚您的意图：您希望对所有项目采取行动，而不是停留在中间。
numbers.forEach {
    print($0)
}

/// 如何使用zip()函数连接俩个数组, 每个数组一一组合成元组, 如果您的两个阵列大小不同，它将自动选择两者中较短的一个。这样可以避免尝试同时读取两个数组，并且当一个数组较短时会意外地超出范围。
let wizards = ["Harry", "Ron", "Hermione"]
let animals = ["Hedwig", "Scabbers", "Crookshanks"]
let combined1 = zip(wizards, animals)
print(Array(combined1))

/// 如何使用typealias使复杂类型更容易使用
typealias Name = (first: String, last: String)

/// Private vs fileprivate：有什么区别
// 这两种形式的访问控制是相似的，但有两个不同之处。
// 如果你标记某些内容，fileprivate它可以在同一个文件中的任何地方被读取 - 甚至在类型之外。另一方面，private属性只能在声明它的类型内读取，或者在同一文件中创建的该类型的扩展内读取。
// 在实践中，你可能会看到private使用得多于fileprivate。

/// 从数组中删除对象的所有实例
// 数组已经有了查找和删除单个项目的方法，或者一次删除所有项目，但它们没有内置的方法来删除单个项目的所有实例。例如，如何删除以下数组中的所有2？
var numberArray = [2, 1, 2, 3, 2, 4, 2, 5]
extension Array where Element: Equatable {
    mutating func remove(_ obj: Element) {
        self = self.filter { $0 != obj}
    }
}
numberArray.remove(2)

/// 从集合中删除匹配元素：removeAll（where :)
// 该removeAll(where:)方法为集合执行高性能的就地过滤器。你给它一个关闭条件来运行，它将去除所有符合你条件的对象。
// 使用removeAll(where:)比使用反向filter()调用更具可读性，因为它指定了您不想要的内容而不是您想要的内容。它的性能也比filter()因为它将对象移除到位，因此避免了额外的复制。
var pythos = ["John", "Michael", "Graham", "Terry", "Eric", "Terry"]
pythos.removeAll { $0 == "Terry" }
print(pythos)

/// 使用stride（）循环遍历一系列数字
// Swift有一个很有用的功能stride()，它允许您使用任何增量从一个值移动到另一个值 - 甚至可以指定上限是独占的还是包含的。
// 包含0, 但不包含10
for i in stride(from: 0, to: 10, by: 2) {
    print(i)
}
// 包含0, 10
for i in stride(from: 0, through: 10, by: 2) {
    print(i)
}

/// 什么是便利初始化器？指定的初始化器?
class Polygon {
    var points: [CGPoint]
    
    // 便利初始化器
    init(points: [CGPoint]) {
        self.points = points
    }
    // 指定的初始化器
    convenience init(squareWithLength length: CGFloat) {
        let points = [
            CGPoint(x: 0, y: 0),
            CGPoint(x: length, y: 0),
            CGPoint(x: length, y: length),
            CGPoint(x: 0, y: length),
        ]
        
        self.init(points: points)
    }
}

let polygn = Polygon(squareWithLength: 100.0)

/// 什么是泛型?
struct Queue<T> {
    private var internalArray = [T]()
    
    var count: Int {
        return internalArray.count
    }
    
    mutating func add(_ item: T) {
        internalArray.append(item)
    }
    
    mutating func remove() -> T? {
        if internalArray.count > 0 {
            return internalArray.removeFirst()
        } else {
            return nil
        }
    }
}
let queue = Queue<Int>()

/// 什么是keyValuePairs?
// KeyValuePairs，DictionaryLiteral在Swift 5.0之前有点容易混淆，是一种有用的数据类型，它提供了类似字典的功能，并带来了一些好处：
// 你的钥匙不需要符合Hashable。
// 您可以添加具有重复键的项目。
// 将保留添加项目的顺序
let singer: KeyValuePairs = ["firstName": "Taylor", "lastName": "Swift"]
// 如果我们想要访问第一个项目的键名和值，我们会写这样的东西：
print("\(singer[0].key) is set to \(singer[1].value)")
// 更好的是，因为KeyValuePairs从Sequence协议继承，我们可以遍历所有键和值，如下所示：
for value in singer {
    print("\(value.key) is set to \(value.value)")
}

/// 什么是协议扩展
extension BinaryInteger {
    // Self: 大写字母S指的是Self符合协议的任何类型, 例如, Int或者UInt32
    func squared() -> Self {
        // self: 小写字母s指的是该类型的当前值
        return self * self
    }
}
let i: Int = 5
let j: UInt8 = 7
print(i.squared())
print(j.squared())

/// 什么是静态方法和变量?
// 静态方法和变量属于定义它们的类型，而不是该类型的实例。例如，我们可以创建一个结构来跟踪城市中的出租车
struct Taxi {
    var ownerName: String
    var licensePlate: String
    
    // 该结构的每个实例都将拥有自己的ownerName和licensePlate属性字符串。但是，如果我们在该结构中创建了一个静态属性，那么它将由所有出租车共享。例如，我们可以添加此属性来存储城市中存在多少辆出租车：
    static var count: Int = 0
}
// 当我们想要引用我们需要使用的属性时Taxi.count，因为它属于struct而不是该struct的实例。

// 静态方法也是如此，有时称为“类型方法” - 它们属于定义它们的结构或类，而不是类的实例。在实践中，这意味着您无法self在方法内部使用，因为没有要引用的实例。

/// 什么是懒惰序列?
// 延迟序列是常规序列，其中每个项目是按需计算而不是预先计算。例如，考虑这个数字数组：
let lazynumbers = Array(1...100000)
// 这将持有100,000个数字。现在，如果我们想要将所有这些数字加倍，我们会写下这样的东西：
let lazydoubled = lazynumbers.map { $0 * 2 }
// 这将导致Swift将所有100,000个数字翻倍，有时这正是您想要的。但是，如果您知道您打算只使用少数几个，则可以使计算变得懒惰，如下所示
let lazyDlubled = lazynumbers.lazy.map { $0 * 2 }
// 现在该map()调用不会在前面进行任何工作 - 它只是将原始数组（数字1到100,000）与转换闭包（每个数字加倍）一起存储。因此，当您请求项目5,000时，它可以为您计算一个，并在一瞬间返回它 - 节省了大量时间。

/// 什么是throws?
// 如果出现问题，抛出函数会标记错误，Swift要求您在代码中处理这些错误。

// 要创建抛出函数，只需throws在函数的返回值之前写入。您应该定义可以抛出的错误类型，因此该函数的用户知道会发生什么。
enum LoginErrors: Error {
    case badUsername
    case badPassword
}
// 我们现在可以使用它来创建一个名为的抛出函数login()。如果用户名为空，我们将抛出badUsername，如果密码为空，我们将抛出badPassword，如果两者都是非空的，我们将返回true：
func login(username: String, password: String) throws -> Bool {
    if username.isEmpty {
        throw LoginErrors.badUsername
    }
    if password.isEmpty {
        throw LoginErrors.badPassword
    }
    return true
}
// 由于该函数引发错误，它都必须用被称为try，try?或try!。

/// KVO
// 键值观察是Swift将代码附加到变量的能力，因此无论何时更改变量，代码都会运行。它类似于属性观察者（willSet和didSet），除了KVO用于在类型定义之外添加观察者。

// KVO在纯Swift代码中并不是非常好，因为它依赖于Objective-C运行时 - 您需要使用@objc继承的类NSObject，然后使用标记每个属性@objc dynamic。
@objc class Personkvo: NSObject {
    @objc dynamic var name = "Taylor Swift"
}
let taylorkvo = Personkvo()
taylorkvo.observe(\Personkvo.name
, options: .new) { (person, change) in
    print("i am now called \(person.name)")
}
taylorkvo.name = "Justin Bieber"

/// == 和 === 有什么区别?
// 首先，==是等于运算符，它测试两个事物对于那些事物使用的“相等”的定义是否相等。例如，5 == 5是的，因为它==表示整数比较，对于其他内置值类型（如字符串，布尔值和双精度数）也是如此。

// 当==与您构建的结构一起使用时，事情变得更加复杂，因为默认情况下它们无法进行比较 - 您需要使它们符合Equatable协议。

// 相比之下，===是身份运算符，它检查一个类的两个实例是否指向同一个内存。这与相等不同，因为使用相同值独立创建的两个对象将被视为相等，==但不是===因为它们是不同的对象。

// ===只有在使用类时，运算符才可用，因为结构体的设计使它们始终唯一引用。


/// 静态变量和类变量之间有什么区别？
// 无论是static和class关键字，让我们变量附加到类而不是类的实例。
// 它们在何处static和class不同之处是它们如何支持继承：当您创建一个static属性时，它将由类拥有并且不能由子类更改，而在您使用class它时可能会在需要时被覆盖。
class Persontest {
    static var count: Int {
        return 250
    }
    
    class var averageAge: Double {
        return 30
    }
}

class Studenttest: Persontest {
    // THIS ISN'T ALLOWED
//    override static var count: Int {
//        return 150
//    }
    
    // THIS IS ALLOWED
    override class var averageAge: Double {
        return 19.5
    }
}

/// Any和AnyObject有什么区别？
// Swift有两种匿名类型：Any和AnyObject。它们略有不同，您需要迟早使用它们。

// AnyObject指的是类的任何实例，并且等同id于Objective-C。当您特别想要使用引用类型时，它非常有用，因为它不允许使用任何Swift的结构或枚举。AnyObject当您想要限制协议以便它只能用于类时，也会使用它。

// Any指的是类，结构或枚举的任何实例 - 根本就是任何东西。
