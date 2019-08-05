import UIKit

// 选择排序
func selectionSort(sortArray: [NSInteger]) -> [NSInteger] {
    var tempSortArray = sortArray
    let sortArrayCount = sortArray.count
    
    for i in 0 ..< sortArrayCount {
        var minIndex = i
        for j in minIndex + 1 ..< sortArrayCount {
            if tempSortArray[minIndex] > tempSortArray[j] {
                minIndex = j
            }
        }
        let temValue = tempSortArray[i]
        tempSortArray[i] = tempSortArray[minIndex]
        tempSortArray[minIndex] = temValue
    }
    return tempSortArray
}

var sortArray = [10, 5, 9, 2, 0, 3, 1]
print(selectionSort(sortArray: sortArray))

