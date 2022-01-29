import UIKit

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let rRow = matrix.count
        let rColumn = matrix.first!.count
        if rRow == 1 {
            for i in 0..<rColumn {
                if matrix[0][i] == "1" {
                    return 1
                }
            }
            return 0
        }
        if rColumn == 1 {
            for i in 0..<rRow {
                if matrix[i][0] == "1" {
                    return 1
                }
            }
            return 0
        }
        var max = 0
        var dp = [[Int]](repeating: [Int](repeating: 0, count: rColumn), count: rRow)
        for i in 0..<rRow {
            if matrix[i][0] == "1" {
                dp[i][0] = 1
                max = 1
            }
        }
        for i in 0..<rColumn {
            if matrix[0][i] == "1" {
                dp[0][i] = 1
                max = 1
            }
        }
        for i in 1..<rRow {
            for j in 1..<rColumn {
                if matrix[i][j] == "0" {
                    dp[i][j] = 0
                }
                else {
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                    if dp[i][j] * dp[i][j]  > max {
                        max = dp[i][j] * dp[i][j]
                    }
                }
            }
        }
        return max
    }
}
