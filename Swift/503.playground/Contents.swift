import UIKit

class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        let nCount = nums.count
        var result = [Int](repeating: -1, count: nCount)
        var stk = [Int]()
        for i in 0...(nCount * 2 - 1) {
            while stk.count > 0 && nums[stk.last!] < nums[i % nCount] {
                result[stk.popLast()!] = nums[i % nCount]
            }
            stk.append(nums[i % nCount])
        }
        return result
    }
}
