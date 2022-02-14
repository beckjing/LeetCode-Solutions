import UIKit

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        if n == 1 {
            return
        }
        var right = n / 2 - 1
        var bottom = 0
        if n % 2 == 0 {
            bottom = n / 2 - 1
        }
        else {
            bottom = n / 2
        }
        for i in 0...bottom {
            for j in 0...right {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[n - j - 1][i]
                matrix[n - j - 1][i] = matrix[n - i - 1][n - j - 1]
                matrix[n - i - 1][n - j - 1] = matrix[j][n - i - 1]
                matrix[j][n - i - 1] = tmp
            }
        }
    }
}
