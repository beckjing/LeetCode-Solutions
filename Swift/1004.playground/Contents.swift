import Cocoa

class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        let nCount = nums.count
        if nCount <= k {
            return nCount
        }
        var zeroCount = 0
        var start = 0
        var end = 0
        var result = 0
        while end < nCount {
            if zeroCount < k {
                if nums[end] == 0 {
                    zeroCount += 1
                    result = max(result, end - start + 1)
                }
                end += 1
            }
            else if zeroCount == k {
                if nums[end] == 0 {
                    zeroCount += 1
                }
                else {
                    result = max(result, end - start + 1)
                }
                end += 1
            }
            else {
                if nums[start] == 0 {
                    zeroCount -= 1
                }
                start += 1
            }
        }
        return result
    }
}

Solution().longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3)
