import UIKit

class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        let mRow = matrix.count
        let mColumn = matrix.first!.count
        var result = 0
        if mRow == 1 {
            for i in 0..<mColumn {
                if matrix[0][i] == 1 {
                    result += 1
                }
            }
            return result
        }
        if mColumn == 1 {
            for i in 0..<mRow {
                if matrix[i][0] == 1 {
                    result += 1
                }
            }
            return result
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: mColumn), count: mRow)
        for i in 0..<mColumn {
            if matrix[0][i] == 1 {
                dp[0][i] = 1
                result += 1
            }
        }
        for i in 1..<mRow {
            if matrix[i][0] == 1 {
                dp[i][0] = 1
                result += 1
            }
        }
        
        for i in 1..<mRow {
            for j in 1..<mColumn {
                if matrix[i][j] == 0 {
                    dp[i][j] = 0
                }
                else {
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                    result += dp[i][j]
                }
            }
        }
        return result
    }
}
