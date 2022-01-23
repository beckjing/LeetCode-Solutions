import UIKit

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        let row = matrix.count
        if row == 0 {
            return result
        }
        let column = matrix.first!.count
        if column == 0 {
            return result
        }
        var direction = 0
        var left = 0
        var top = 0
        var right = column - 1
        var bottom = row - 1
        while right >= left && bottom >= top {
            if direction == 0 {//右
                for i in left...right {
                    result.append(matrix[top][i])
                }
                top += 1
            }
            else if direction == 1 {//下
                for i in top...bottom {
                    result.append(matrix[i][right])
                }
                right -= 1
            }
            else if direction == 2 {//左
                for i in left...right {
                    result.append(matrix[bottom][left + right - i])
                }
                bottom -= 1
            }
            else if direction == 3 {//上
                for i in top...bottom {
                    result.append(matrix[top + bottom - i][left])
                }
                left += 1
            }
            direction = (direction + 1) % 4
        }
        return result
    }
}

Solution().spiralOrder([])
