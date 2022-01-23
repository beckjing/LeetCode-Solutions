import UIKit

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var result = 0
        let nCount = nums.count
        var index = 0
        while index < nCount {
            result += nums[index]
            result -= index
            index += 1
        }
        return index - result
    }
}
