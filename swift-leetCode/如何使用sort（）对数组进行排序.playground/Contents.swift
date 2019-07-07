import UIKit

var names = ["Jemima", "Peter", "David", "Kelly", "Isabella"]

// 对数组排序, 直接调用sort
names.sort()
print(names)

// 对自定义结构或类排序, 使用对指定字段进行排序的尾随闭包进行调用
struct MyCustomStruct {
    var someSortableField: String
}

var customArray = [
    MyCustomStruct(someSortableField: "Jemima"),
    MyCustomStruct(someSortableField: "Peter"),
    MyCustomStruct(someSortableField: "David"),
    MyCustomStruct(someSortableField: "Kelley"),
    MyCustomStruct(someSortableField: "Isabella")
]

customArray.sort {
    $0.someSortableField < $1.someSortableField
}

print(customArray)

// 如果要返回已排序的数组而不是将其排序, 请使用sorted()
let sortedArray = customArray.sorted {
    $0.someSortableField < $1.someSortableField
}
print(sortedArray)

