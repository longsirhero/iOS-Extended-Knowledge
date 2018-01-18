
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class MyClass {
    @objc func callMe() {
        print("Hi")
    }
}

let object = MyClass()

Timer.scheduledTimer(timeInterval: 1, target: object,
                selector: #selector(MyClass.callMe), userInfo: nil, repeats: true)

let url = URL(string: "http://httpbin.org/get")!

let getTask = URLSession.shared.dataTask(with: url) {
    (data, response, error) in
    let dictionary = try! JSONSerialization.jsonObject(with: data!, options: [])
    
    print(dictionary)
}

getTask.resume()