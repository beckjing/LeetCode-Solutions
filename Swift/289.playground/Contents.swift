import UIKit

class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        let row = board.count
        if row == 0 {
            return
        }
        let column = board.first!.count
        if column == 0 {
            return
        }
        var diff = [[Int]](repeating: [Int](repeating: 0, count: column), count: row)
        for i in 0..<row {
            for j in 0..<column {
                let nextStatus = nextStatus(board, i, j)
                diff[i][j] = nextStatus - board[i][j]
            }
        }
        for i in 0..<row {
            for j in 0..<column {
                board[i][j] += diff[i][j]
            }
        }
    }
    
    func nextStatus(_ board: [[Int]], _ row: Int, _ column: Int) -> Int {
        let bRow = board.count - 1
        let bColumn = board.first!.count - 1
        
        let left = max(0, column - 1)
        let right = min(column + 1, bColumn)
        let top = max(0, row - 1)
        let bottom = min(row + 1, bRow)
        var sum = -board[row][column]
        for i in top...bottom {
            for j in left...right {
                sum += board[i][j]
            }
        }
        if sum == 2 {
            return board[row][column]
        }
        if sum == 3 {
            return 1
        }
        return 0
    }
}
