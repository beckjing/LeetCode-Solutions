import UIKit

class Solution {
    func numSquares(_ n: Int) -> Int {
        var result = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
            var minn = Int.max
            var j = 1
            while j * j <= i {
                minn = min(minn, result[i - j * j])
                j += 1
            }
            result[i] = minn + 1
        }
        return result[n]
    }
}
