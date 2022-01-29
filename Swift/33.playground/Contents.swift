import UIKit

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let nCount = nums.count
        if nCount == 0 {
            return -1
        }
        if nCount == 1 {
            return nums.first == target ? 0 : -1
        }
        var start = 0
        var end = nCount - 1
        while start <= end {
            let middle = start + (end - start) / 2
            if nums[middle] == target {
                return middle
            }
            if nums[0] <= nums[middle] {
                if nums[0] <= target && target < nums[middle] {
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
        return -1
    }
}

Solution().search([4,5,6,7,0,1,2], 3)
