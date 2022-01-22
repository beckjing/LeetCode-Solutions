import UIKit

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var max = nums.first!
        let nCount = nums.count
        if nCount > 1 {
            var dpMax = [Int](repeating: Int.min, count: nCount)
            var dpMin = [Int](repeating: Int.max, count: nCount)
            dpMax[0] = nums.first!
            dpMin[0] = nums.first!
            for i in 1..<nCount {
                let dpMaxPre = dpMax[i - 1] * nums[i]
                let dpMinPre = dpMin[i - 1] * nums[i]
                var tArr = [dpMaxPre, dpMinPre, nums[i]]
                tArr.sort()
                dpMax[i] = tArr.last!
                dpMin[i] = tArr.first!
                if dpMax[i] > max {
                    max = dpMax[i]
                }
            }
        }
        return max
    }
}

Solution().maxProduct([2,3,-2,4])
