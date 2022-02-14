import UIKit

class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        var lCount = 0
        var rCount = 0
        var result = 0
        for char in s {
            if char == "L" {
                lCount += 1
            }
            else {
                rCount += 1
            }
            if lCount == rCount {
                result += 1
                lCount = 0
                rCount = 0
            }
        }
        return result
    }
}
