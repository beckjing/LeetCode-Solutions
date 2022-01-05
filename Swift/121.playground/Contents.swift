import UIKit

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let pCount = prices.count
        var buy = [Int](repeating: 0, count: pCount)
        var sell = [Int](repeating: 0, count: pCount)
        buy[0] = -prices[0]
        sell[0] = 0
        var result = 0
        for i in 1..<pCount {
            buy[i] = max(buy[i - 1], -prices[i])
            sell[i] = max(sell[i - 1], prices[i] + buy[i - 1])
            if result < sell[i] {
                result = sell[i]
            }
        }
        return result
    }
}

Solution().maxProfit([7,1,5,3,6,4])
