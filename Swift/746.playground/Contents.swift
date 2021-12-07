import UIKit

class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var f_n_2 = cost[0]
        var f_n_1 = cost[1]
        var f_n = 0
        for i in 2...cost.count {
            f_n = min(f_n_1, f_n_2)
            
        }
        return f_n
    }
}

print(Solution().minCostClimbingStairs([10, 15, 20]))
