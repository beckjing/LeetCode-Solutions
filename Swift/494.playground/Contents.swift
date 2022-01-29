import UIKit

class Solution {
    
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        return findTargetSumWays__inner(nums, target, 0)
    }
    
    
    func findTargetSumWays__inner(_ nums: [Int], _ target: Int, _ start: Int) -> Int {
        var result = 0
        if start == nums.count - 1 {
            if nums[start] == -target {
                result += 1
            }
            if nums[start] == target {
                result += 1
            }
            return result
        }
        result += findTargetSumWays__inner(nums, target - nums[start], start + 1)
        result += findTargetSumWays__inner(nums, target + nums[start], start + 1)
        return result
    }
    
}
