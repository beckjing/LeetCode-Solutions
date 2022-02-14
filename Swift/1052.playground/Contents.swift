import UIKit

class Solution {
    func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ minutes: Int) -> Int {
        let cCount = customers.count
        var dp = [Int](repeating: 0, count: cCount - minutes + 1)
        var result = 0
        for i in 0..<minutes {
            result += customers[i]
        }
        if cCount - minutes > 0 {
            for i in minutes..<cCount {
                result += customers[i] * (1 - grumpy[i])
            }
            dp[0] = result
            for i in 1...cCount - minutes {
                let end = i + minutes - 1
                dp[i] = dp[i - 1]
                if grumpy[i - 1] == 1 {
                    dp[i] += -customers[i - 1]
                }
                if grumpy[end] == 1 {
                    dp[i] += customers[end]
                }
                result = max(result, dp[i])
            }
        }
        return result
    }
}

print(Solution().maxSatisfied([1,0,1,2,1,1,7,5], [0,1,0,1,0,1,0,1], 3))
