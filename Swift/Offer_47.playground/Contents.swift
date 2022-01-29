import UIKit

class Solution {
    func maxValue(_ grid: [[Int]]) -> Int {
        let row = grid.count
        if row == 0 {
            return 0
        }
        let column = grid.first!.count
        if column == 0 {
            return 0
        }
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: column), count:row)
        dp[0][0] = grid[0][0]
        for i in 1..<row {
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        }
        for j in 1..<column {
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        }
        for i in 1..<row {
            for j in 1..<column {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]) + grid[i][j]
            }
        }
        return dp.last!.last!
    }
}
