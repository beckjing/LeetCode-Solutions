import UIKit

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        let nCount = nums.count
        var rightMost = 0
        for i in 0..<nCount {
            if i <= rightMost {
                rightMost = max(rightMost, i + nums[i])
                if rightMost >= nCount - 1 {
                    return true
                }
            }
        }
        return false
    }
}

Solution().canJump([2,3,1,1,4])
