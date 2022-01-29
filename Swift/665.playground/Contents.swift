import UIKit

class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        let nCount = nums.count
        if nCount <= 2 {
            return true
        }
        var change = 0
        var stk = Array<Int>()
        stk.append(nums.first!)
        for i in 1..<nCount {
            if nums[i] >= stk.last! {
                stk.append(nums[i])
            }
            else {
                if stk.count == 1 || nums[i] >= stk[stk.count - 2] {
                    stk[stk.count - 1] = nums[i]
                }
                stk.append(stk.last!)
                change += 1
            }
            if change > 1 {
                return false
            }
        }
        return true
    }
}
