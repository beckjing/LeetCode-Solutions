import UIKit

class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        var stk1 = [Int]()
        var stk2 = [Int]()
        let nCount = nums.count
        var result = nCount
        for i in 0..<nCount {
            while stk1.last != nil && stk1.last! > nums[i] {
                stk1.popLast()
            }
            while stk2.last != nil && stk2.last! < nums[nCount - i - 1]  {
                stk2.popLast()
            }
            stk1.append(nums[i])
            stk2.append(nums[nCount - i - 1])
        }
        if stk1.count == nCount {
            return 0
        }
        for i in 0..<stk1.count {
            if stk1[i] == nums[i] {
                result -= 1
            }
            else {
                break
            }
        }
        for i in 0..<stk2.count {
            if stk2[i] == nums[nCount - i - 1] {
                result -= 1
            }
            else {
                break
            }
        }
        return result
    }
}
