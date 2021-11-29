import UIKit

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        var middle = (start + end) / 2
        while start <= end && end > 0 {
            if nums[middle] == target {
                return middle
            }
            if nums[middle] > target {
                end = middle - 1
            }
            else {
                start = middle + 1
            }
            middle = (start + end) / 2
        }
        if middle < 0 {
            return -1
        }
        return nums[middle] == target ? middle : -1
    }
}
