import UIKit

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let pCount = prices.count
        if pCount == 0 {
            return 0
        }
        var dpMin = [Int](repeating: Int.max, count: pCount)
        dpMin[0] = prices.first!
        var result = 0
        for i in 1..<pCount {
            let price = prices[i]
            dpMin[i] = min(dpMin[i - 1], price)
            result = max(price - dpMin[i - 1], result)
        }
        return result
    }
}
