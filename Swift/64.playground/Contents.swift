import Cocoa

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let gRow = grid.count
        let gColumn = grid.first!.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: gColumn), count: gRow)
        dp[0][0] = grid.first!.first!
        for i in 1..<gColumn {
            dp[0][i] = dp[0][i - 1] + grid.first![i]
        }
        for j in 1..<gRow {
            dp[j][0] = dp[j - 1][0] + grid[j][0]
        }
        for i in 1..<gRow {
            for j in 1..<gColumn {
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + grid[i][j]
            }
        }
        return dp.last!.last!
    }
}

Solution().minPathSum([[1,3,1],[1,5,1],[4,2,1]])


