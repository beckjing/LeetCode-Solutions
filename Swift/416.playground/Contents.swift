import UIKit

class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        if nums.count < 2 {
            return false
        }
        var sum = 0
        for num in nums {
            sum += num
        }
        if sum % 2 == 1 {
            return false
        }
        return search(nums.sorted(), sum / 2)
    }
    
    func search(_ nums: [Int], _ target: Int) -> Bool {
        let nCount = nums.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: target + 1), count: nCount)
        for i in 0..<nCount {
            dp[i][0] = true
        }
        dp[0][nums[0]] = true
        for i in 1..<nCount {
            let num = nums[i]
            for j in 1...target {
                print(i, j, num)
                if j >= num {
                    dp[i][j] = dp[i - 1][j] || dp[i - 1][j - num]
                }
                else {
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        return dp[nCount - 1][target]
    }
}

Solution().canPartition([1,2,5])
