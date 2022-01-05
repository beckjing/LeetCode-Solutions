import Cocoa

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        var tmpMatrix = matrix
        var dir = 0
        var currentX = 0
        var currentY = 0
        let height = matrix.count
        let length = matrix[0].count
        var remain = height * length
        let tag = -200
        while remain > 0 {
            print(result)
            if dir == 0 {
                if currentX < length && tmpMatrix[currentY][currentX] != tag {
                    result.append(tmpMatrix[currentY][currentX])
                    tmpMatrix[currentY][currentX] = tag
                    currentX += 1
                }
                else {
                    currentX -= 1
                    currentY += 1
                    dir = (dir + 1) % 4
                    continue
                }
            }
            else if dir == 1 {
                if currentY < height && tmpMatrix[currentY][currentX] != tag {
                    result.append(tmpMatrix[currentY][currentX])
                    tmpMatrix[currentY][currentX] = tag
                    currentY += 1
                }
                else {
                    currentY -= 1
                    currentX -= 1
                    dir = (dir + 1) % 4
                    continue
                }
            }
            else if dir == 2 {
                if currentX >= 0 && tmpMatrix[currentY][currentX] != tag {
                    result.append(tmpMatrix[currentY][currentX])
                    tmpMatrix[currentY][currentX] = tag
                    currentX -= 1
                }
                else {
                    currentX += 1
                    currentY -= 1
                    dir = (dir + 1) % 4
                    continue
                }
            }
            else {
                if currentY >= 0 && tmpMatrix[currentY][currentX] != tag {
                    result.append(tmpMatrix[currentY][currentX])
                    tmpMatrix[currentY][currentX] = tag
                    currentY -= 1
                }
                else {
                    currentY += 1
                    currentX += 1
                    dir = (dir + 1) % 4
                    continue
                }
            }
            remain -= 1
        }
        return result
    }
}

print(Solution().spiralOrder([[2,5],[8,4],[0,-1]]))
