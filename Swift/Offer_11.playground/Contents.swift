import UIKit

class Solution {
    func minArray(_ numbers: [Int]) -> Int {
        let nCount = numbers.count
        var start = 0
        var end = nCount - 1
        while start < end {
            let middle = start + (end - start) / 2
            if numbers[middle] < numbers[end] {
                end = middle
            }
            else if numbers[middle] > numbers[end] {
                start = middle + 1
            }
            else {
                end -= 1
            }
        }
        return numbers[start]
    }
}

print(Solution().minArray([10,1,10,10,10]))
