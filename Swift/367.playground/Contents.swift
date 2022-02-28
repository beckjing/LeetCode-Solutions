import UIKit

class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var start = 0
        var end = num
        while start < end {
            let middle = start + (end - start) / 2
            if middle * middle > num {
                end = middle
            }
            else if middle * middle == num {
                return true
            }
            else {
                start = middle + 1
            }
        }
        return start * start == num
    }
}

Solution().isPerfectSquare(14)
