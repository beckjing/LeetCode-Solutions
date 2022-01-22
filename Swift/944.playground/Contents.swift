import UIKit

class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        let gRow = grid.count
        let gColumn = grid.first!.count
        var stk = [[Int]]()
        var gridC = grid
        for i in 0..<gRow {
            for j in 0..<gColumn {
                if grid[i][j] == 2 {
                    stk.append([i, j])
                }
            }
        }
        var times = -1
        while stk.count > 0 {
            var tmp = [[Int]]()
            for point in stk {
                let row = point.first!
                let column = point.last!
                if row > 0 && gridC[row - 1][column] == 1 {
                    tmp.append([row - 1, column])
                    gridC[row - 1][column] = 2
                }
                if row < gRow - 1 && gridC[row + 1][column] == 1 {
                    tmp.append([row + 1, column])
                    gridC[row + 1][column] = 2
                }
                if column > 0 && gridC[row][column - 1] == 1 {
                    tmp.append([row, column - 1])
                    gridC[row][column - 1] = 2
                }
                if column < gColumn - 1 && gridC[row][column + 1] == 1 {
                    tmp.append([row, column + 1])
                    gridC[row][column + 1] = 2
                }
            }
            stk = tmp
            times += 1
        }
        for i in 0..<gRow {
            for j in 0..<gColumn {
                if gridC[i][j] == 1 {
                    return -1
                }
            }
        }
        return times == -1 ? 0 : times
    }
}

Solution().orangesRotting([[2,1,1],[1,1,0],[0,1,1]])
