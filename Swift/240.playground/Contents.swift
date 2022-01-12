import Cocoa

class Solution {
    func searchMatrixRC(_ matrix: [[Int]],
                        _ startR: Int,
                        _ startC: Int,
                        _ endR: Int,
                        _ endC: Int,
                        _ target: Int) -> Bool {
        if (endR - startR) < 2 || (endC - startC) < 2 {
            for row in startR...endR {
                for column in startC...endC {
                    print(matrix[row][column])
                    if matrix[row][column] == target {
                        return true
                    }
                }
            }
            return false
        }
        var sR = startR
        var sC = startC
        var eR = endR
        var eC = endC
        if matrix[sR][sC] == target {
            return true
        }
        if matrix[eR][eC] == target {
            return true
        }
        while sR < eR - 1 && sC < eC - 1 {
            if matrix[sR][sC] > target {
                return false
            }
            if matrix[eR][eC] < target {
                return false
            }
            let middleR = (sR + eR) / 2
            let middleC = (sC + eC) / 2
            if matrix[middleR][middleC] > target {
                eR = middleR
                eC = middleC
            }
            else if matrix[middleR][middleC] < target {
                sR = middleR
                sC = middleC
            }
            else {
                return true
            }
        }
        if searchMatrixRC(matrix, startR, sC + 1, eR - 1, endC, target) {
            return true
        }
        if searchMatrixRC(matrix, sR + 1, startC, endR, eC - 1, target) {
            return true
        }
        return false
    }
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        return searchMatrixRC(matrix, 0, 0, matrix.count - 1, matrix.first!.count - 1, target)
    }
}

print(Solution().searchMatrix([[1,4,5],[3,7,12],[5,7,16],[7,10,17],[10,11,20],[11,14,22]], 10))
