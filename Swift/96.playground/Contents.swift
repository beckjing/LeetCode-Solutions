import UIKit

class Solution {
    func numTrees(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2...n {
            for j in 1...i {
                dp[i] += dp[j - 1] * dp[i - j]
            }
        }
        print(dp)
        return dp.last!
    }
}

Solution().numTrees(4)
