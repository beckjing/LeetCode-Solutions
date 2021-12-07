import UIKit

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        var f_n_2 = nums[0]
        var f_n_1 = nums[1]
        var f_n = 0
        for i in 2..<nums.count {
            f_n = max(nums[i] + f_n_2, f_n_1)
            f_n_2 = f_n_1
            f_n_1 = f_n
        }
        return f_n
    }
}
