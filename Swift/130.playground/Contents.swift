import UIKit

class Solution {
    func solve(_ board: inout [[Character]]) {
        let row = board.count
        let column = board.first!.count
        for i in 0..<row {
            if board[i][0] == "O" {
                tag(&board, i, 0)
            }
            if board[i][column - 1] == "O" {
                tag(&board, i, column - 1)
            }
        }
        for j in 0..<column {
            if board[0][j] == "O" {
                tag(&board, 0, j)
            }
            if board[row - 1][j] == "O" {
                tag(&board, row - 1, j)
            }
        }
        for i in 0..<row {
            for j in 0..<column {
                if board[i][j] == "T" {
                    board[i][j] = "O"
                }
                else if board[i][j] == "O" {
                    board[i][j] = "X"
                }
            }
        }
    }
    
    func tag(_ board: inout [[Character]], _ row: Int, _ column: Int) {
        if board[row][column] == "O" {
            board[row][column] = "T"
            let bRow = board.count
            let bColumn = board.first!.count
            if row > 0 {
                tag(&board, row - 1, column)
            }
            if row < bRow - 1 {
                tag(&board, row + 1, column)
            }
            if column > 0 {
                tag(&board, row, column - 1)
            }
            if column < bColumn - 1 {
                tag(&board, row, column + 1)
            }
        }
    }
}
