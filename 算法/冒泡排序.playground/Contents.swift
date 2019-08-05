import UIKit

/// 冒泡排序
func bubbleSort(sortArray: [NSInteger]) -> [NSInteger] {
    var temSortArray = sortArray
    let sortArrayCount = sortArray.count
    
    for i in 0 ..< sortArrayCount {
        
        for j in 0 ..< sortArrayCount - i - 1 {
            if temSortArray[j] > temSortArray[j+1] {
                let temValue = temSortArray[j]
                temSortArray[j] = temSortArray[j+1]
                temSortArray[j+1] = temValue
            }
        }
    }
    return temSortArray
}

var sortArray = [0, 2, 9, 4, 10, 1, 3]
var sortedArray = bubbleSort(sortArray: sortArray)
print(sortedArray)

