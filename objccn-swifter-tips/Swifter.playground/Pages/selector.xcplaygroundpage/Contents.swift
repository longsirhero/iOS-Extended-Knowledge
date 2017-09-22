import Foundation

class MyObject: NSObject {
    @objc func callMe() {
        //...
    }
    
    @objc func callMeWithParam(obj: AnyObject!) {
        //...
    }
    
    @objc func turn(by angle: Int, speed: Float) {
        //...
    }
    
    func selectors() -> [Selector] {
        let someMethod = #selector(callMe)
        let anotherMethod = #selector(callMeWithParam(obj:))
        let method = #selector(turn(by:speed:))

        return [someMethod, anotherMethod, method]
    }
    
    func otherSelectors() -> [Selector] {
        let someMethod = #selector(callMe)
        let anotherMethod = #selector(callMeWithParam)
        let method = #selector(turn)
        
        return [someMethod, anotherMethod, method]
    }
    
    
    @objc func commonFunc() {
        
    }
    
    @objc func commonFunc(input: Int) -> Int {
        return input
    }
    
    func sameNameSelectors() -> [Selector] {
        let method1 = #selector(commonFunc as ()->())
        let method2 = #selector(commonFunc as (Int)->Int)
        return [method1, method2]
    }
}

let selectors = MyObject().selectors()
print(selectors)

let otherSelectors = MyObject().otherSelectors()
print(otherSelectors)

let sameNameSelectors = MyObject().sameNameSelectors()
print(sameNameSelectors)
