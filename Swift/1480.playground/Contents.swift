import UIKit

class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        let nCount = nums.count
        var result = [Int](repeating: nums.first!, count: nCount)
        for i in 1..<nCount {
            result[i] = result[i - 1] + nums[i]
        }
        return result
    }
}
