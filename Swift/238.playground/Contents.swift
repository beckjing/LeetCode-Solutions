import UIKit

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let nCount = nums.count
        var result = [Int](repeating: 1, count: nCount)
        var tmp = 1
        for i in 1..<nCount {
            tmp *= nums[i]
            result[i] = tmp
        }
        tmp = 1
        for i in 1..<nCount {
            tmp *= nums[nCount - i - 1]
            result[nCount - i - 1] *= tmp
        }
        return result
    }
}
