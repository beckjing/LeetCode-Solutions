import UIKit

class Solution {
    func exchange(_ nums: [Int]) -> [Int] {
        let nCount = nums.count
        var start = 0
        var end = nCount - 1
        var result = nums
        while start < end {
            while nums[start] % 2 == 1 {
                start += 1
                if start > end {
                    return result
                }
            }
            while nums[end] % 2 == 0 {
                end -= 1
                if end < start {
                    return result
                }
            }
            result.swapAt(start, end)
            start += 1
            end -= 1
        }
        return result
                
    }
}
