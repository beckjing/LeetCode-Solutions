import UIKit

class Solution {
    func integerBreak(_ n: Int) -> Int {
        var dp = [Int](repeating: 1, count: n + 1)
        for i in 2...n {
            dp[i] = max(dp[i], i - 1)
            for j in 1...(i / 2) {
                dp[i] = max(dp[i], j * (i - j))
                dp[i] = max(dp[i], j * dp[i - j])
                dp[i] = max(dp[i], dp[j] * (i - j))
                dp[i] = max(dp[i], dp[j] * dp[i - j])
            }
        }
        return dp.last!
    }
}

Solution().integerBreak(10)
