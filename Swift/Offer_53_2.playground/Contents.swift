import UIKit

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let nCount = nums.count
        var start = 0
        var end = nCount - 1
        while start <= end {
            let middle = start + (end - start) / 2
            if nums[middle] == middle {
                start = middle + 1
            }
            else {
                end = middle - 1
            }
        }
        return start
    }
}

Solution().missingNumber([0])
