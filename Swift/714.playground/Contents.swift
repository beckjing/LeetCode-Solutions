import UIKit

class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let pCount = prices.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: pCount)
        dp[0][0] = -prices.first!
        dp[0][1] = 0
        for i in 1..<pCount {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] - prices[i])
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] + prices[i] - fee)
        }
        print(dp)
        return dp.last![1]
    }
}

Solution().maxProfit([1,3,2,8,4,9], 2)
