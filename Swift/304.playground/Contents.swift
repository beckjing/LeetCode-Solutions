import UIKit

class NumMatrix {
    
    var matrix: [[Int]]?
    var dp: [[Int]]?
    var row: Int?
    var column: Int?
    
    init(_ matrix: [[Int]]) {
        self.matrix = matrix
        self.row = matrix.count
        self.column = matrix.first!.count
        self.dp = [[Int]](repeating: [Int](repeating: Int.min, count: self.column!), count: self.row!)
        for i in 0..<self.row! {
            for j in 0..<self.column! {
                if i == 0 && j == 0 {
                    self.dp![i][j] = matrix[i][j]
                }
                else if i == 0 {
                    self.dp![i][j] = self.dp![i][j - 1] + self.matrix![i][j]
                }
                else if j == 0 {
                    self.dp![i][j] = self.dp![i - 1][j] + self.matrix![i][j]
                }
                else {
                    self.dp![i][j] = self.dp![i - 1][j] + self.dp![i][j - 1] - self.dp![i - 1][j - 1] + self.matrix![i][j]
                }
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var result = self.dp![row2][col2]
        if col1 > 0 {
            result -= self.dp![row2][col1 - 1]
        }
        if row1 > 0 {
            result -= self.dp![row1 - 1][col2]
        }
        if col1 > 0 && row1 > 0 {
            result += self.dp![row1 - 1][col1 - 1]
        }
        return result
    }
}
