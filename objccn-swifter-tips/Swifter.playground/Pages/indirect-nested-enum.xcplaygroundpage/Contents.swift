
import Foundation

//class Node<T> {
//    let value: T?
//    let next: Node<T>?
//    
//    init(value: T?, next: Node<T>?) {
//        self.value = value
//        self.next = next
//    }
//}
//
//let list = Node(value: 1,
//    next: Node(value: 2,
//        next: Node(value: 3,
//            next: Node(value: 4, next: nil))))


indirect enum LinkedList<Element: Comparable> {
    case empty
    case node(Element, LinkedList<Element>)
    
    func removing(_ element: Element) -> LinkedList<Element> {
        guard case let .node(value, next) = self else {
            return .empty
        }
        return value == element ?
            next : LinkedList.node(value, next.removing(element))
    }
}

let linkedList = LinkedList.node(1, .node(2, .node(3, .node(4, .empty))))
print(linkedList)

let result1 = linkedList.removing(2)
print(result1)

let result2 = linkedList.removing(100)
print(result2)

let emptyList = LinkedList<Int>.empty
let result3 = emptyList.removing(12)
print(result3)

