import UIKit

class Solution {
    func minSteps(_ n: Int) -> Int {
        var result = 0
        var i = 2
        var remain = n
        while i * i <= remain {
            while remain % i == 0 {
                remain = remain / i
                result += i
            }
            i += 1
        }
        if remain > 1 {
            result += remain
        }
        return result
    }
}

Solution().minSteps(5)
