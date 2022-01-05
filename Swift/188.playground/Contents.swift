import Cocoa

class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let pricesCount = prices.count
        if pricesCount == 0 {
            return 0
        }
        let times = min(k,  pricesCount / 2)
        var buy = [[Int]](repeating: [Int](repeating: 0, count: times + 1), count: pricesCount)
        var sell = [[Int]](repeating: [Int](repeating: 0, count: times + 1), count: pricesCount)
        print(buy)
        buy[0][0] = -prices[0]
        sell[0][0] = 0
        for i in 1..<times+1 {
            buy[0][i] = -2000
        }
        for i in 1..<times+1 {
            sell[0][i] = -2000
        }
        
        for i in 1..<pricesCount {
            buy[i][0] = max(buy[i - 1][0], sell[i - 1][0] - prices[i])
            for j in 1..<times+1 {
                buy[i][j] = max(buy[i - 1][j], sell[i - 1][j] - prices[i])
                sell[i][j] = max(sell[i - 1][j], buy[i - 1][j - 1] + prices[i])
            }
        }
        return sell[pricesCount - 1].sorted().first!
    }
}

Solution().maxProfit(2, [2,4,1])
