import Cocoa

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let nCount = nums.count
        var numsCopy = nums
        for i in 0..<nCount {
            if numsCopy[i] <= 0 {
                numsCopy[i] = nCount + 1
            }
        }
        for i in 0..<nCount {
            let numsI = abs(numsCopy[i])
            if numsI < nCount + 1 {
                numsCopy[numsI - 1] = -abs(numsCopy[numsI - 1])
            }
        }
        for i in 0..<nCount {
            if numsCopy[i] > 0 {
                return i + 1
            }
        }
        return nCount + 1
    }
}

print(Solution().firstMissingPositive([1,2,0]))
