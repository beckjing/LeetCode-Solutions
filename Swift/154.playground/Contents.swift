import UIKit

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count - 1
        while start < end {
            let middle = start + (end - start) / 2
            if nums[middle] < nums[end] {
                end = middle
            }
            else if nums[middle] > nums[end] {
                start = middle + 1
            }
            else {
                end -= 1
            }
        }
        return nums[start]
    }
}

Solution().findMin([2,2,2,0,1])
