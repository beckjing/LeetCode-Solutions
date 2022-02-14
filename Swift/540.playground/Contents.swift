import UIKit

class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
}
