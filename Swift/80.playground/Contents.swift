import UIKit

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var result = nums.count
        var current = nums.first!
        var cCount = 1
        var index = 1
        while index < nums.count {
            if nums[index] == current {
                if cCount == 2 {
                    nums.remove(at: index)
                    result -= 1
                    index -= 1
                }
                else {
                    cCount += 1
                }
            }
            else {
                current = nums[index]
                cCount = 1
            }
            index += 1
        }
        return result
    }
}

var test = [1,1,1,2,2,3]
Solution().removeDuplicates(&test)
print(test)
