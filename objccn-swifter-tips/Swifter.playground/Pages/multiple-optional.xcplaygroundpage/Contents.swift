
import Foundation

var string: String? = "string"
var anotherString: String?? = string

var literalOptional: String?? = "string"

var aNil: String? = nil

var anotherNil: String?? = aNil
var literalNil: String?? = nil

if anotherNil != nil {
    // This will output.
    print("anotherNil")
}

if literalNil != nil {
    // This will not output.
    print("literalNil")
}
