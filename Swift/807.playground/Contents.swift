import UIKit

class Solution {
    
    func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
        let row = grid.count
        let column = grid.first!.count
        var rowMax = [Int](repeating: 0, count: row)
        var columnMax = [Int](repeating: 0, count: column)
        for i in 0..<row {
            for j in 0..<column {
                rowMax[i] = max(rowMax[i], grid[i][j])
                columnMax[j] = max(columnMax[j], grid[i][j])
            }
        }
        var result = 0
        for i in 0..<row {
            for j in 0..<column {
                let finalHigh = max(min(rowMax[i], columnMax[j]), grid[i][j])
                result += finalHigh - grid[i][j]
            }
        }
        return result
    }
    
}
