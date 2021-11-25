import UIKit

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var f_n = Array<Int>()
        var max = nums.first!
        f_n.append(nums.first!)
        for i in 1..<nums.count {
            if f_n[i-1] > 0 {
                f_n.append(f_n[i-1] + nums[i])
            }
            else {
                f_n.append(nums[i])
            }
            if f_n[i] > max {
                max = f_n[i]
            }
        }
        return max
    }
}


