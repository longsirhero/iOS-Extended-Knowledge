import UIKit

let set = NSCountedSet()
set.add("Bob")
set.add("Charlotte")
set.add("John")
set.add("Bob")
set.add("James")
set.add("Sophie")
set.add("Bob")
set.add("Bob")

print(set.count(for: "Bob"))
print(set.count)

// 现在它是如何工作的：一个集合就像一个数组，除了每个项目只能出现一次。如果我们在上面的代码中使用了一个数组，它将包含七个对象：三个Bobs，一个Charlotte，一个John，一个James和一个Sophie。如果我们在上面的代码中使用了Swift集(set)，它将包含四个对象：一个Bob，一个Charlotte，一个John，一个James和一个Sophie - 该集合确保每个项目只出现一次。

// 现在为扭曲：NSCountedSet在每个对象只能出现一次的情况下，类似于一个集合，但它会跟踪每个项目的添加和删除次数。因此，我们的计数集将包含四个对象（如果它是常规集），但NSCountedSet有一个count(for:)方法将报告Bob添加了三次。
