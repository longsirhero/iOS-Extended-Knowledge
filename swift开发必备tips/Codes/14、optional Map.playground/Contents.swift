import UIKit

let num: Int? = 3

let result = num.map { $0 * 2 }

print(result ?? "")
