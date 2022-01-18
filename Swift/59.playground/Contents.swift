import Cocoa

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var result = [[Int]](repeating: [Int](repeating: 1, count: n), count: n)
        var direction = 0
        var top = 0
        var left = 0
        var bottom = n - 1
        var right = n - 1
        var current = 1
        while current <= (n * n) {
            if direction == 0 {//右
                for i in left...right {
                    result[top][i] = current
                    current += 1
                }
                top += 1
            }
            else if direction == 1 {//下
                for i in top...bottom {
                    result[i][right] = current
                    current += 1
                }
                right -= 1
            }
            else if direction == 2 {//左
                for i in (left...right).reversed() {
                    result[bottom][i] = current
                    current += 1
                }
                bottom -= 1
            }
            else if direction == 3 {//上
                for i in (top...bottom).reversed() {
                    result[i][left] = current
                    current += 1
                }
                left += 1
            }
            direction = (direction + 1) % 4
        }
        return result
    }
}
