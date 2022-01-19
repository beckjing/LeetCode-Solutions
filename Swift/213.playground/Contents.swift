import UIKit

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        if nums.count == 1 {
            return nums.first!
        }
        let nCount = nums.count
        var dp1 = [Int](repeating: 0, count: nCount - 1)
        var dp2 = [Int](repeating: 0, count: nCount)
        dp1[0] = nums[0]
        dp1[1] = max(nums[0], nums[1])
        dp2[0] = 0
        dp2[1] = nums[1]
        for i in 2..<(nCount - 1) {
            dp1[i] = max(nums[i] + dp1[i - 2], dp1[i - 1])
        }
        for i in 2..<nCount {
            dp2[i] = max(nums[i] + dp2[i - 2], dp2[i - 1])
        }
        return dp1.last! > dp2.last! ? dp1.last! : dp2.last!
    }
}

Solution().rob([0,0])
