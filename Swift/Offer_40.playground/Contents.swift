import UIKit

class Solution {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        var arrC = arr
        quickSort(&arrC, 0, arrC.count - 1)
        return Array<Int>(arrC[0..<k])
    }
    
    func quickSort(_ arr: inout [Int], _ start: Int, _ end: Int) {
        if start >= end {
            return
        }
        let index = partition(&arr, start, end)
        quickSort(&arr, start, index - 1)
        quickSort(&arr, index + 1, end)
    }
    
    func partition(_ arr: inout [Int], _ start: Int, _ end: Int) -> Int {
        var index = start
        for i in start...end {
            if arr[i] < arr[end] {
                arr.swapAt(index, i)
                index += 1
            }
        }
        arr.swapAt(index, end)
        return index
    }
    
}
