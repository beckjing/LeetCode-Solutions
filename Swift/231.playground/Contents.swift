import UIKit

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var remain = n
        while remain > 0 {
            if remain % 2 == 0 {
                remain /= 2
            }
            else {
                if remain == 1 {
                    return true
                }
                else {
                    break
                }
            }
        }
        return false
    }
}
