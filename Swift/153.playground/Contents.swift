import UIKit

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        let nCount = nums.count
        if nCount == 1 {
            return nums.first!
        }
        else if nCount == 2 || nums.first! < nums.last! {
            return min(nums.first!, nums.last!)
        }
        var start = 0
        var end = nCount - 1
        while start < end {
            let middle = (start + end) / 2
            if nums[middle] >= nums.first! {
                start = middle + 1
            }
            else if nums[middle] < nums.last!  {
                end = middle
            }
        }
        return nums[start]
    }
}

Solution().findMin([3,1,2])
