import UIKit

class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        let sortedN = nums.sorted().reversed()
        let maxNum = sortedN.first!
        var sums = [Int](repeating: 0, count: maxNum + 1)
        var dp = [Int](repeating: 0, count: maxNum + 1)
        for num in sortedN {
            sums[num] += num
        }
        dp[1] = sums[1]
        if maxNum >= 2 {
            for i in 2...maxNum {
                dp[i] = max(dp[i - 1],  dp[i - 2] + sums[i])
            }
        }
        return dp.last!
    }
}

print(Solution().deleteAndEarn([3,4,2]))
