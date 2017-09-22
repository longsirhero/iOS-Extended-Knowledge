
import Foundation

/* Wrong code
struct User {
    var age : Int
    var weight : Int
    var height : Int
    
    func gainWeight(newWeight: Int) {
        weight += newWeight
    }
}
*/

struct User {
    var age : Int
    var weight : Int
    var height : Int
    
    mutating func gainWeight(newWeight: Int) {
        weight += newWeight
    }
}

var u = User(age: 1, weight: 1, height: 1)
u.gainWeight(newWeight: 2)
u

