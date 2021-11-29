import UIKit

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        while start < end {
            let middle = (start + end) / 2
            if nums[middle] > target {
                end = middle
            }
            else if nums[middle] < target {
                start = middle + 1
            }
            else {
                return middle
            }
            print("\(start) \(middle) \(end)")
        }
        if nums[start] < target {
            return start + 1
        }
        return start
    }
}

Solution().searchInsert([1,3,5,6], 7)


