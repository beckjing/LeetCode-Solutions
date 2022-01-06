import UIKit

class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        var copyC = citations
        let cCount = copyC.count
        quickSort(arr: &copyC, low: 0, high: cCount - 1)
        var result = 1
        for c in copyC.reversed() {
            if c > result {
                result += 1
            }
            else if c == result {
                break
            }
            else {
                result = c + 1
            }
        }
        return result
    }
    
    func quickSort(arr: inout[Int], low: Int, high: Int) {
        if low > high {
            return
        }
        let middleIndex = partion(arr: &arr, low: low, high: high)
        quickSort(arr: &arr, low: low, high: middleIndex - 1)
        quickSort(arr: &arr, low: middleIndex + 1, high: high)
    }
    
    func partion(arr: inout[Int], low: Int, high: Int) -> Int {
        let middle = arr[high]
        var index = low
        for i in low...high {
            if arr[i] < middle {
                if i != index {
                    arr.swapAt(i, index)
                }
                index += 1
            }
        }
        if high != index {
            arr.swapAt(index, high)
        }
        return index
    }
    
}
