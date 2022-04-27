import UIKit

class Solution {
    
    func addDigits(_ num: Int) -> Int {
        var result = 0
        var numT = num
        while numT != 0 {
            result += numT % 10
            numT /= 10
        }
        if result > 10 {
            result = addDigits(result)
        }
        return result
    }
    
}
