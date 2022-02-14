import UIKit

class Solution {
    
    func numEnclaves(_ grid: [[Int]]) -> Int {
        var result = 0
        var travelG = grid
        let row = grid.count
        let column = grid.first!.count
        for i in 0..<row {
            if grid[i][0] == 1 {
                travel(&travelG, [i, 0])
            }
            if grid[i][column - 1] == 1 {
                travel(&travelG, [i, column - 1])
            }
        }
        for j in 0..<column {
            if grid[0][j] == 1 {
                travel(&travelG, [0, j])
            }
            if grid[row - 1][j] == 1 {
                travel(&travelG, [row - 1, j])
            }
        }
        for i in 0..<row {
            for j in 0..<column {
                if travelG[i][j] == 1 {
                    result += 1
                }
            }
        }
        return result
    }
    
    func travel(_ grid: inout [[Int]], _ point: [Int]) {
        let pRow = point.first!
        let pColumn = point.last!
        let row = grid.count
        let column = grid.first!.count
        grid[pRow][pColumn] = 0
        if pRow > 0 && grid[pRow - 1][pColumn] == 1 {
            travel(&grid, [pRow - 1, pColumn])
        }
        if pRow < row - 1 && grid[pRow + 1][pColumn] == 1 {
            travel(&grid, [pRow + 1, pColumn])
        }
        if pColumn > 0 && grid[pRow][pColumn - 1] == 1 {
            travel(&grid, [pRow, pColumn - 1])
        }
        if pColumn < column - 1 && grid[pRow][pColumn + 1] == 1 {
            travel(&grid, [pRow, pColumn + 1])
        }
    }
}
