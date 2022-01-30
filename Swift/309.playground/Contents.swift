import UIKit

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let pCount = prices.count
        if pCount == 1 {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: pCount)
        dp[0][0] = -prices[0]
        dp[0][1] = 0
        dp[0][2] = 0
        for i in 1..<pCount {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][2] - prices[i])
            dp[i][1] = dp[i - 1][0] + prices[i]
            dp[i][2] = max(dp[i - 1][1], dp[i - 1][2])
        }
        var result: Int = 0
        for i in 1...2 {
            result = max(dp[pCount - 1][i], result)
        }
        return result
    }
}
