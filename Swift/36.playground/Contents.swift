import Cocoa

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var checkDic = Dictionary<Character, Bool>()
        for row in board {
            for column in row {
                if column != "." {
                    if checkDic[column] != nil {
                        return false
                    }
                    checkDic[column] = true
                }
            }
            checkDic.removeAll()
        }
        for i in 0..<9 {
            for j in 0..<9 {
                if board[j][i] != "." {
                    if checkDic[board[j][i]] != nil {
                        return false
                    }
                    checkDic[board[j][i]] = true
                }
            }
            checkDic.removeAll()
        }
        for i in 0..<3 {
            for j in 0..<3 {
                for x in (i*3)..<(i*3 + 3) {
                    for y in (j*3)..<(j*3 + 3) {
                        if board[x][y] != "." {
                            if checkDic[board[x][y]] != nil {
                                return false
                            }
                            checkDic[board[x][y]] = true
                        }
                    }
                }
                checkDic.removeAll()
            }
        }
        return true
    }
}

Solution().isValidSudoku([["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
)
