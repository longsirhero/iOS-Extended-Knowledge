import UIKit

class MyManager {
    static let shared = MyManager()
    
    private init() {
        
    }
    
    func dowork() {
        print("do world")
    }
}


let shared = MyManager.shared

shared.dowork()

