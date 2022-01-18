import Cocoa

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var result = nums.first!
        var count = 1
        for i in 1..<nums.count {
            let tmp = nums[i]
            if count == 0 {
                result = tmp
                count += 1
            }
            else if tmp != result {
                count -= 1
            }
            else {
                count += 1
            }
        }
        return result
    }
}
