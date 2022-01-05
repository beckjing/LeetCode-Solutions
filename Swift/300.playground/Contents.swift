import UIKit


class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let nCount = nums.count
        if nCount == 1 {
            return 0
        }
        var dp = [Int](repeating: 1, count: nCount)
        var result = 0
        for i in 1..<nCount {
            var maxDp = 0
            for j in 0..<i {
                if nums[j] < nums[i] {
                    if dp[j] > maxDp {
                        maxDp = dp[j]
                    }
                }
            }
            dp[i] = maxDp + 1
            if result < maxDp + 1 {
                result = maxDp + 1
            }
        }
        return result
    }
}

