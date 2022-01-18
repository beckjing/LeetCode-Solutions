import Cocoa

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        result.append([1])
        for i in 1..<numRows {
            var row = [Int](repeating:1, count: i + 1)
            for j in 1..<i {
                row[j] = result[i - 1][j - 1] + result[i - 1][j]
            }
            result.append(row)
        }
        return result
    }
}
