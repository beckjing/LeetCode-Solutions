import UIKit

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var result = 0
        var cur = 0
        for num in nums {
            if num == 1 {
                cur += 1
                result = max(result, cur)
            }
            else {
                cur = 0
            }
        }
        return result
    }
}
