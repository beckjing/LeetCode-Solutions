import Cocoa

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var result = 0
        var checkGrid = grid
        let rows = grid.count
        let columns = grid.first!.count
        for row in 0..<rows {
            for column in 0..<columns {
                if checkGrid[row][column] == "1" {
                    result += 1
                    drawIsLands(&checkGrid, row: row, column: column)
                }
            }
        }
        return result
    }
    
    func drawIsLands(_ grid: inout [[Character]], row: Int, column: Int) {
        if row >= 0 && row < grid.count {
            if column >= 0 && column < grid.first!.count {
                if grid[row][column] == "1" {
                    grid[row][column] = "0"
                    drawIsLands(&grid, row: row - 1, column: column)
                    drawIsLands(&grid, row: row + 1, column: column)
                    drawIsLands(&grid, row: row, column: column - 1)
                    drawIsLands(&grid, row: row, column: column + 1)
                }
            }
        }
    }
}

Solution().numIslands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]])
