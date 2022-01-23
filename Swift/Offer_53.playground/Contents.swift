import UIKit

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let nCount = nums.count
        if nCount == 1 {
            return nums.first! == target ? 1 : 0
        }
        var start = 0
        var end = nCount - 1
        while start < end {
            let middle = start + (end - start) / 2
            if target > nums[end] {
                return 0
            }
            if target < nums[start] {
                return 0
            }
            if nums[middle] > target {
                end = middle - 1
            }
            else if nums[end] > target {
                end -= 1
            }
            if nums[middle] < target {
                start = middle + 1
            }
            else if nums[start] < target {
                start += 1
            }
            if nums[start] == nums[end] {
                if nums[start] != target {
                    return 0
                }
                return end - start + 1
            }
        }
        return 0
    }
}

Solution().search([5,7,7,8,8,10], 6)
