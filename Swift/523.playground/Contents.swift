import UIKit

class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        let nCount = nums.count
        var dic = Dictionary<Int, Int>()
        dic[0] = 0
        var sum = 0
        for i in 0..<nCount {
            sum += nums[i]
            if dic[sum % k] == nil {
                dic[sum % k] = i + 1
            }
            else {
                let index = dic[sum % k]!
                if i + 1 - index > 1 {
                    return true
                }
            }
        }
        return false
    }
}
