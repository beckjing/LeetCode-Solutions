import UIKit

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        let nCount = nums.count
        if nCount == 1 {
            return
        }
        var left = nCount - 2
        while left >= 0 && nums[left] >= nums[left + 1] {
            left -= 1
        }
        if left >= 0 {
            var right = nCount - 1
            while right >= 0 && nums[left] >= nums[right]  {
                right -= 1
            }
            nums.swapAt(left, right)
        }
        for i in (left + 1)..<(nCount + left + 1) / 2 {
            nums.swapAt(i, nCount + left - i)
        }
    }
}
var arr = [1,2,3]
Solution().nextPermutation(&arr)
