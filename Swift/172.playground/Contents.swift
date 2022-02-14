import UIKit

class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        var sum = 0
        var remain = n
        while remain > 0 {
            sum += remain / 5
            remain /= 5
        }
        
        return sum
    }
}
