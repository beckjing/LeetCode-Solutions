import UIKit

class Solution {
    func grayCode(_ n: Int) -> [Int] {
        if n == 1 {
            return [0, 1]
        }
        var tmp = grayCode(n - 1)
        var result = tmp
        var times = (pow(2, n - 1) as NSDecimalNumber).intValue
        for item in tmp.reversed() {
            result.append(item + times)
        }
        return result
    }
}
