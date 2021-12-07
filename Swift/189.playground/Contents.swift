import UIKit

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if k == 0 || nums.count == 1 {
            return
        }
        let nums_count = nums.count
        let act_k = k % nums_count
        if act_k == 0 {
            return
        }
        var tmp: Int?
        for i in 0...(nums_count / 2 - 1) {
            tmp = nums[i]
            nums[i] = nums[nums_count - i - 1]
            nums[nums_count - i - 1] = tmp!
        }
        if act_k >= 2 {
            for i in 0...(act_k / 2 - 1) {
                tmp = nums[i]
                nums[i] = nums[act_k - i - 1]
                nums[act_k - i - 1] = tmp!
            }
            
        }
        if (nums_count - act_k) >= 2 {
            for i in 0...((nums_count - act_k) / 2 - 1) {
                tmp = nums[i + act_k]
                nums[i + act_k] = nums[nums_count - i - 1]
                nums[nums_count - i - 1] = tmp!
            }
        }
        
    }
}
