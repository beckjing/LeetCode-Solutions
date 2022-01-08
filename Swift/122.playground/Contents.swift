import UIKit

class Solution0 {
    func maxProfit(_ prices: [Int]) -> Int {
        var stk = Array<Int>()
        var hasStock = false
        var result = 0
        let nCount = prices.count
        for i in 0..<nCount {
            while stk.count > 0 && stk.last! > prices[i] {
                if hasStock {
                    result += stk.last! - stk.first!
                    stk.removeAll()
                    hasStock = false
                }
                else {
                    stk.popLast()
                }
            }
            stk.append(prices[i])
            if stk.count > 0 {
                hasStock = true
            }
        }
        if hasStock {
            result += stk.last! - stk.first!
        }
        return result
    }
}

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var result = 0
        let nCount = prices.count
        for i in 1..<nCount {
            result += max(0, prices[i] - prices[i - 1])
        }
        return result
    }
}

