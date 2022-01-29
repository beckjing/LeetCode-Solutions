import UIKit

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var left = false
        var top = false
        var right = false
        var bottom = false
        let row = matrix.count
        let column = matrix.first!.count
        if row == 0 || column == 0 {
            return
        }
        if row == 1 {
            var hasZ = false
            for j in 0..<column {
                hasZ = hasZ || (matrix[0][j] == 0)
            }
            if hasZ {
                for j in 0..<column {
                    matrix[0][j] = 0
                }
            }
            return
        }
        if column == 1 {
            var hasZ = false
            for i in 0..<row {
                hasZ = hasZ || (matrix[i][0] == 0)
            }
            if hasZ {
                for i in 0..<row {
                    matrix[i][0] = 0
                }
            }
            return
        }
        for i in 0..<column {
            if matrix[0][i] == 0 {
                top = true
                break
            }
        }
        for i in 0..<column {
            if matrix[row - 1][i] == 0 {
                bottom = true
                break
            }
        }
        for j in 0..<row {
            if matrix[j][0] == 0 {
                left = true
                break
            }
        }
        for j in 0..<row {
            if matrix[j][column - 1] == 0 {
                right = true
                break
            }
        }
        for i in 1..<row - 1 {
            for j in 1..<column - 1 {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        for i in 1..<row - 1 {
            if matrix[i][0] == 0 || matrix[i][column - 1] == 0 {
                for j in 0..<column {
                    matrix[i][j] = 0
                }
            }
        }
        for j in 1..<column - 1 {
            if matrix[0][j] == 0 || matrix[row - 1][j] == 0 {
                for i in 0..<row {
                    matrix[i][j] = 0
                }
            }
        }
        if left {
            for i in 0..<row {
                matrix[i][0] = 0
            }
        }
        if right {
            for i in 0..<row {
                matrix[i][column - 1] = 0
            }
        }
        if top {
            for j in 0..<column {
                matrix[0][j] = 0
            }
        }
        if bottom {
            for j in 0..<column {
                matrix[row - 1][j] = 0
            }
        }
    }
}
