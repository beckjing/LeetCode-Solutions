import UIKit

class Solution {
    
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let rCount = mat.count
        let cCount = mat.first!.count
        var result = [[Int]](repeating: [Int](repeating: -1, count: cCount), count: rCount)
        var current = 1
        var stk = [[Int]]()
        for i in 0..<rCount {
            for j in 0..<cCount {
                if mat[i][j] == 0 {
                    stk.append([i, j])
                    result[i][j] = 0
                }
            }
        }
        while stk.count > 0 {
            var tmpS = [[Int]]()
            for point in stk {
                let pRow = point.first!
                let pColumn = point.last!
                if pRow - 1 >= 0 {
                    if result[pRow - 1][pColumn] == -1 {
                        tmpS.append([pRow - 1, pColumn])
                        result[pRow - 1][pColumn] = current
                    }
                }
                if pRow + 1 < rCount {
                    if result[pRow + 1][pColumn] == -1 {
                        tmpS.append([pRow + 1, pColumn])
                        result[pRow + 1][pColumn] = current
                    }
                }
                print(pRow, pColumn)
                if pColumn - 1 >= 0 {
                    if result[pRow][pColumn - 1] == -1 {
                        tmpS.append([pRow, pColumn - 1])
                        result[pRow][pColumn - 1] = current
                    }
                }
                if pColumn + 1 < cCount {
                    if result[pRow][pColumn + 1] == -1 {
                        tmpS.append([pRow, pColumn + 1])
                        result[pRow][pColumn + 1] = current
                    }
                }
            }
            stk = tmpS
            current += 1
        }
        return result
    }
}

Solution().updateMatrix([[0,0,0],[0,1,0],[0,0,0]])
