import UIKit

@objc func callMe() {
    print("hello")
}

@objc func callMeWithParam(obj: AnyObject) {
    print("world")
}

let someMethod = #selector(callMe)

let anotherMethod = #selector(callMeWithParam(obj:))

@objc class Person {}
