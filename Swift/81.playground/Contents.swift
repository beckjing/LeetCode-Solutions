import UIKit

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        let nCount = nums.count
        if nCount == 0 {
            return false
        }
        if nCount == 1 {
            return nums.first == target
        }
        var start = 0
        var end = nCount - 1
        while start <= end {
            let middle = start + (end - start) / 2
            if nums[middle] == target {
                return true
            }
            if nums[start] == nums[middle] && nums[middle] == nums[end] {
                start += 1
                end -= 1
            }
            else if nums[start] <= nums[middle] {
                if nums[start] <= target && target < nums[middle] {
                    end = middle - 1
                }
                else {
                    start = middle + 1
                }
            }
            else {
                if nums[middle] < target && target <= nums[nCount - 1] {
                    start = middle + 1
                }
                else {
                    end = middle - 1
                }
            }
        }
        return false
    }
}

Solution().search([1,0,1,1,1], 0)

