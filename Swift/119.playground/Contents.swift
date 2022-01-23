import UIKit

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var result = [Int](repeating: 1, count: rowIndex + 1)
        if rowIndex >= 2 {
            for i in 2...rowIndex {
                for j in 1..<i {
                    result[i - j] = result[i - j] + result[i - j - 1]
                }
            }
        }
        return result
    }
}
