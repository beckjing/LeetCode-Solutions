import Cocoa

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var zero = 0
        var one = 0
        let nCount = nums.count
        for num in nums {
            if num == 0 {
                zero += 1
            }
            else if num == 1 {
                one += 1
            }
        }
        for i in 0..<zero {
            nums[i] = 0
        }
        for i in zero..<zero + one {
            nums[i] = 1
        }
        for i in zero + one..<nCount {
            nums[i] = 2
        }
    }
}
