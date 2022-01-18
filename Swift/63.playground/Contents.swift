import Cocoa

class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        
        let oRow = obstacleGrid.count
        let oColumn = obstacleGrid.first!.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: oColumn), count: oRow)
        if obstacleGrid.first?.first == 1 {
            return 0
        }
        else {
            dp[0][0] = 1
        }
        //init
        for i in 1..<oColumn {
            if obstacleGrid.first![i] == 1 || dp[0][i - 1] == 0 {
                dp[0][i] = 0
            }
            else {
                dp[0][i] = 1
            }
        }
        for j in 1..<oRow {
            if obstacleGrid[j].first! == 1 || dp[j - 1][0] == 0 {
                dp[j][0] = 0
            }
            else {
                dp[j][0] = 1
            }
        }
        for i in 1..<oRow {
            for j in 1..<oColumn {
                if obstacleGrid[i][j] == 1 {
                    dp[i][j] = 0
                }
                else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
        return dp.last!.last!
    }
}
