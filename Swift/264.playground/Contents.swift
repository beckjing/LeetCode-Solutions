import UIKit

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n)
        dp[0] = 1
        var num2 = 0
        var num3 = 0
        var num5 = 0
        for i in 1..<n {
            dp[i] = min(2 * dp[num2], 3 * dp[num3], 5 * dp[num5])
            if dp[num2] * 2 == dp[i] {
                num2 += 1
            }
            if dp[num3] * 3 == dp[i] {
                num3 += 1
            }
            if dp[num5] * 5 == dp[i] {
                num5 += 1
            }
        }
        print(dp)
        return dp.last!
    }
}
