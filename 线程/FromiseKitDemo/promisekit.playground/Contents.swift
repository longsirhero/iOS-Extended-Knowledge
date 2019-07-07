import UIKit

import PromiseKit

// http://www.hangge.com/blog/cache/detail_2231.html

func cook() -> Promise<String> {
    print("开始做饭")
    let p = Promise<String>{ resolver in
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
            print("做饭完毕")
            resolver.fulfill("鸡蛋炒饭")
            
//            print("做饭失败")
//            let error = NSError(domain: "PromiseKitTutorial", code: 0, userInfo: [NSLocalizedDescriptionKey: "烧焦的米"])
//            resolver.reject(error)
        })
    }
    return p
}

func eat(data: String) -> Promise<String> {
    print("开始做饭" + data)
    let p = Promise<String> { resolver in
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
            print("吃饭完毕")
            resolver.fulfill("一块碗和一双筷子")
        })
    }
    return p
}

func wash(data: String) -> Promise<String> {
    print("开始洗碗" + data)
    let p = Promise<String>{ resolver in
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
            print("洗碗完毕")
            resolver.fulfill("干净的碗筷")
        })
    }
    return p
}

/// 使用then\done\catch链式调用这三个方法:
// then() 方法要求输入一个 promise 值并返回一个 promise，而 map() 是根据先前 promise 的结果，然后返回一个新的对象或值类型。
// compactMap() 与 map() 类似，不过它是返回 Optional。比如我们返回 nil，则整个链会产生 PMKError.compactMap 错误。
// 如果想要在链路中获取值用于其他操作，比如输出调试。那么可以使用 get()、tap() 这两个方法，它们都不会影响到原有链路逻辑。
// get() 方法只有前面是完成状态（fulfilled）时才会调用，它得到的是具体结果对象：
// tap() 方法是不管前面是完成（fulfilled）还是失败（rejected）都会调用，同时它得到的是 Result<T>：

_ = cook()
    .get { data in
        print("get ---> \(data)")
    }
    .tap { data in
        print("tap ---> \(data)")
    }
    .map({ data -> String in
        return data + ", 配上一碗汤"
    })
    .then { data -> Promise<String> in
        return eat(data: data)
    }.then { data -> Promise<String> in
        return wash(data: data)
    }.done {data in
        print(data)
    }.catch {error in
        print(error.localizedDescription + " 没法吃了")
    }.finally {
        print("出门上班")
}

/// when 方法提供了并行执行异步操作的能力，并且只有在所有异步操作执行完后才执行回调。
/// 和其他的 promise 链一样，when 方法中任一异步操作发生错误，都会进入到下一个 catch 方法中。
// 比如下面代码，两个异步操作是并行执行的，等到它们都执行完后才会进到 done 里面。同时 when 会把所有异步操作的结果传给 done。
func catup() -> Promise<String> {
    print("::::::::开始切菜")
    let p = Promise<String>{ resolver in
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            print("::::::::切菜完毕")
            resolver.fulfill("::::::::切好的菜")
        })
    }
    return p
}


func boil() -> Promise<String> {
    print("::::::::开始烧水")
    let p = Promise<String> { resolver in
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
            print("::::::::烧水完毕")
            resolver.fulfill("::::::::烧好的水")
        })
    }
    return p
}

_ = when(fulfilled: catup(), boil())
    .done {result1 , result2 in
        print("::::::::结果: \(result1), \(result2)")
}


/// race 按字面解释，就是赛跑的意思。race 的用法与 when 一样，只不过 when 是等所有异步操作都执行完毕后才执行 then 回调。而 race 的话只要有一个异步操作执行完毕，就立刻执行 then 回调。
// 要注意的是，其它没有执行完毕的异步操作仍然会继续执行，而不是停止。

/// Guarantee 是 Promise 的变种、或者补充，其用法和 Promise 一样，大多情况下二者可以互相替换使用。
// 与 Promise 状态可以是成功或者失败不同，Guarantee 要确保永不失败，因此语法也更简单些。

/// after()
// 想要代码延迟一段时间执行，我们前面都是使用 DispatchQueue 创建延时队列来实现。其实 PromiseKit 已经为我们封装好了 after 这个延迟执行方法。
after(seconds: 5)
    .done { _ in
        print("欢迎访问hangge.com")
}


//    a      c
//    |      |
//    b      d
//    |      |
//        |
//       done
func a() -> Promise<String> {
    print("=====a")
    let p = Promise<String>{ resolver in
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            resolver.fulfill("=====线程a完成")
        }
    }
    return p
}

func b() -> Promise<String> {
    print("=====b")
    let p = Promise<String>{ resolver in
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            resolver.fulfill("=====线程b完成")
        }
    }
    return p
}

func c() -> Promise<String> {
    print("=====c")
    let p = Promise<String>{resolver in
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
            resolver.fulfill("=====线程c完成")
        })
    }
    return p
}

func d() -> Promise<String> {
    print("=====d")
    let p = Promise<String>{resolver in
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
            resolver.fulfill("=====线程d完成")
        })
    }
    return p
}

func test1() -> Promise<String> {
    let p = Promise<String>{ resolver in
       _ = a()
            .then { data -> Promise<String> in
                return b()
            }.done {data in
                print("=====线程a, b完成")
                resolver.fulfill("=====test1 complete!")
        }
    }
    return p
}

func test2() -> Promise<String> {
    let p = Promise<String> {resolver in
        _ = c()
            .then {data -> Promise<String> in
                return d()
            }.done { data in
                print("=====线程c, d完成")
                resolver.fulfill("=====test2 complete!")
        }
    }
    return p
}

_ = when(fulfilled: test1(), test2())
    .done {data in
        print("=====所有线程a,b,c,d执行完毕")
}
