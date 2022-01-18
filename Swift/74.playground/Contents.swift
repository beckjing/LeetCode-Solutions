import Cocoa

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let nRow = matrix.count
        let nColumn = matrix.first!.count
        var start = 0
        var end = nRow * nColumn - 1
        while start < end {
            let middle = (start + end) / 2
            let row = middle / nColumn
            let column = middle % nColumn
            if matrix[row][column] < target {
                start = middle + 1
            }
            else if matrix[row][column] > target {
                end = middle - 1
            }
            else {
                return true
            }
        }
        let row = start / nColumn
        let column = start % nColumn
        return matrix[row][column] == target
    }
}
