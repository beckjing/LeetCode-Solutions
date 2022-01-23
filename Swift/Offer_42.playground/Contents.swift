import UIKit

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        let nCount = nums.count
        var dp = [Int](repeating: Int.min, count: nCount)
        dp[0] = nums[0]
        var max = dp[0]
        var index = 1
        while index < nCount {
            if dp[index - 1] > 0 {
                dp[index] = nums[index] + dp[index - 1]
            }
            else {
                dp[index] = nums[index]
            }
            if dp[index] > max {
                max = dp[index]
            }
            index += 1
        }
        return max
    }
}
