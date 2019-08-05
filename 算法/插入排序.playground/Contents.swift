import UIKit

// 插入排序
func insertionSort(sortArray: [NSInteger]) -> [NSInteger] {
    var tempSortArray = sortArray
    let sortArrayCount = sortArray.count
    
    for i in 1 ..< sortArrayCount {
        let tempValue = tempSortArray[i]
        var insertIndex = 0
        for j in 0 ..< i {
            insertIndex = i - 1 - j
            if tempValue > tempSortArray[insertIndex] {
                insertIndex = i - j
                break
            }
            tempSortArray[insertIndex + 1] = tempSortArray[insertIndex]
        }
        tempSortArray[insertIndex] = tempValue
    }
    return tempSortArray
}

var sortArray = [9, 2, 10 ,3, 0, 5, 4]
print(insertionSort(sortArray: sortArray))

