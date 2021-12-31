import UIKit

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
        var result = Array<String>.init(repeating: "", count: numRows)
        var line = 0
        var dir = 1
        for char in s {
            result[line].append(char)
            if line == (numRows - 1) {
                dir = -1
            }
            else if line == 0 {
                dir = 1
            }
            line += dir
        }
        var resultStr = ""
        for resultS in result {
            resultStr.append(resultS)
        }
        return resultStr
    }
}

print(Solution().convert("PAYPALISHIRING", 3))
