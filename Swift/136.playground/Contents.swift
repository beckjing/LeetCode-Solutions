import Cocoa

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = nums.first!
        for i in 1..<nums.count {
            result ^= nums[i]
        }
        return result
    }
}
