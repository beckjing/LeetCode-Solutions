import Cocoa

class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var result = 0
        var start = 0
        var end = 0
        var curSum = 0
        let nCount = nums.count
        while end < nCount {
            curSum += nums[end]
            while curSum >= target {
                if result == 0 {
                    result = end - start + 1
                }
                else {
                    result = min(result, end - start + 1)
                }
                curSum -= nums[start]
                start += 1
            }
            end += 1
        }
        return result
    }
}

print(Solution().minSubArrayLen(7, [2,3,1,2,4,3]))
