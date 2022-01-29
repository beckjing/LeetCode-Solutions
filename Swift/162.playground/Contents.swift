import UIKit

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        return findPeakElement(nums, 0, nums.count - 1)
    }
    
    func findPeakElement(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        let nCount = nums.count
        print(start, end)
        if end - start < 2 {
            if start == 0 {
                if nums[start] > nums[end] || nCount == 1 {
                    return start
                }
            }
            if end == nCount - 1 {
                if nums[end] > nums[start] {
                    return end
                }
            }
            return -1
        }
        let middle = start + (end - start) / 2
        if nums[middle] > nums[middle - 1] && nums[middle] > nums[middle + 1] {
            return middle
        }
        let left = findPeakElement(nums, start, middle)
        if left >= 0 {
            return left
        }
        return findPeakElement(nums, middle, end)
    }
    
}

Solution().findPeakElement([3, 2, 1])
