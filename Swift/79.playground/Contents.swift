import UIKit

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let bRow = board.count
        let bColumn = board.first!.count
        var wArr = Array<Character>()
        for char in word {
            wArr.append(char)
        }
        for row in 0..<bRow {
            for column in 0..<bColumn {
                let travelled = [[Bool]](repeating: [Bool](repeating: false, count: bColumn), count: bRow)
                if self.exist(board, wArr, [row, column], travelled: travelled) {
                    return true
                }
            }
        }
        return false
    }
    
    func exist(_ board: [[Character]], _ word: Array<Character>, _ start: [Int], travelled: [[Bool]]) -> Bool {
        let row = start.first!
        let column = start.last!
        if board[row][column] != word.first {
            return false
        }
        if word.count == 1 {
            return true
        }
        var travelledTmp = travelled
        travelledTmp[row][column] = true
        let nextCheck = Array<Character>(word[1..<word.count])
        if row > 0 && travelledTmp[row - 1][column] == false {
            if exist(board, nextCheck, [row - 1, column], travelled: travelledTmp) {
                return true
            }
        }
        if row < board.count - 1 && travelledTmp[row + 1][column] == false {
            if exist(board, nextCheck, [row + 1, column], travelled: travelledTmp) {
                return true
            }
        }
        if column > 0 && travelledTmp[row][column - 1] == false {
            if exist(board, nextCheck, [row, column - 1], travelled: travelledTmp) {
                return true
            }
        }
        if column < board.first!.count - 1 && travelledTmp[row][column + 1] == false {
            if exist(board, nextCheck, [row, column + 1], travelled: travelledTmp) {
                return true
            }
        }
        return false
    }
}
