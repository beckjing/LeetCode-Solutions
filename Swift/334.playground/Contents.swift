import Cocoa

class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var first = nums.first!
        var second = Int.max
        for i in 1..<nums.count {
            if nums[i] < first {
                first = nums[i]
            }
            else if first < nums[i] && nums[i] < second {
                second = nums[i]
            }
            else if nums[i] > second {
                return true
            }
        }
        return false
    }
}
