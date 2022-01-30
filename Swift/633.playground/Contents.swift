import UIKit

class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        let n = Int(sqrtf(Float(c)))
        var start = 0
        var end = n
        while start <= end {
            if c == (start * start + end * end) {
                return true
            }
            else if c < (start * start + end * end) {
                end -= 1
            }
            else {
                start += 1
            }
        }
        return false
    }
}
