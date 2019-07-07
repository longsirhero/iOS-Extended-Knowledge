import UIKit
import PromiseKit

// URLSession的扩展
// http://www.hangge.com/blog/cache/detail_2233.html

/// 使用data task加载数据
let urlString = "https://httpbin.org/get?foo=bar"
let url = URL(string: urlString)

let request = URLRequest(url: url!)

_ = URLSession.shared.dataTask(.promise, with: request)
.validate()
    .done({ data, response in
        let str = String(data: data, encoding: String.Encoding.utf8)
        print("---- 请求结果如下 ----")
        print(str ?? "")
    })



