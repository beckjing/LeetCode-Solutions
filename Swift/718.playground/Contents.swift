import UIKit

class Solution {
    
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let nCount1 = nums1.count
        let nCount2 = nums2.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: nCount2), count: nCount1)
        var result = 0
        for i in 0..<nCount1 {
            if nums1[i] == nums2[0] {
                dp[i][0] = 1
                result = 1
            }
        }
        for j in 1..<nCount2 {
            if nums1[0] == nums2[j] {
                dp[0][j] = 1
                result = 1
            }
        }
        
        for i in 1..<nCount1 {
            for j in 1..<nCount2 {
                if nums1[i] == nums2[j] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                    result = max(result, dp[i][j])
                }
            }
        }
        return result
    }
    
}

print(Solution().findLength([1,2,3,2,1], [3,2,1,4,7]))
