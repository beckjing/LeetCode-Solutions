import UIKit

class Solution {
    
    func getMaximumGold(_ grid: [[Int]]) -> Int {
        let row = grid.count
        let column = grid.first!.count
        if row == 1 && column == 1 {
            return grid.first!.first!
        }
        var result = 0
        for i in 0..<row {
            for j in 0..<column {
                if grid[i][j] > 0 {
                    let traveled = [[Bool]](repeating: [Bool](repeating: false, count: column), count: row)
                    result = max(result, getMaximumGold(grid, i, j, traveled))
                }
            }
        }
        return result
    }
    
    func getMaximumGold(_ grid: [[Int]], _ row: Int, _ column: Int, _ traveled: [[Bool]]) -> Int {
        let result = grid[row][column]
        let rCount = grid.count
        let cCount = grid.first!.count
        var nextT = traveled
        nextT[row][column] = true
        var maxNext = 0
        if row > 0 && traveled[row - 1][column] == false && grid[row - 1][column] > 0 {
            maxNext = max(maxNext, getMaximumGold(grid, row - 1, column, nextT))
        }
        if row < rCount - 1 && traveled[row + 1][column] == false && grid[row + 1][column] > 0 {
            maxNext = max(maxNext, getMaximumGold(grid, row + 1, column, nextT))
        }
        if column > 0 && traveled[row][column - 1] == false && grid[row][column - 1] > 0 {
            maxNext = max(maxNext, getMaximumGold(grid, row, column - 1, nextT))
        }
        if column < cCount - 1 && traveled[row][column + 1] == false && grid[row][column + 1] > 0 {
            maxNext = max(maxNext, getMaximumGold(grid, row, column + 1, nextT))
        }
        return result + maxNext
    }
    
}


Solution().getMaximumGold([[0,6,0],[5,8,7],[0,9,0]])
