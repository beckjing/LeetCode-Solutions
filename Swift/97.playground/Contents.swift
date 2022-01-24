import UIKit

class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let sCount1 = s1.count
        let sCount2 = s2.count
        let sCount3 = s3.count
        if sCount1 == 0 {
            return s2 == s3
        }
        if sCount2 == 0 {
            return s1 == s3
        }
        if sCount1 + sCount2 != sCount3 {
            return false
        }
        let sArr1 = Array<Character>(s1)
        let sArr2 = Array<Character>(s2)
        let sArr3 = Array<Character>(s3)
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: sCount2 + 1), count: sCount1 + 1)
        dp[0][0] = true
        for i in 1...sCount1 {
            dp[i][0] = dp[i - 1][0] && (sArr1[i - 1] == sArr3[i - 1])
        }
        for j in 1...sCount2 {
            dp[0][j] = dp[0][j - 1] && (sArr2[j - 1] == sArr3[j - 1])
        }
        if dp[1][0] == false && dp[0][1] == false {
            return false
        }
        for i in 1...sCount1 {
            for j in 1...sCount2 {
                if dp[i][j - 1] {
                    dp[i][j] = (sArr2[j - 1] == sArr3[i + j - 1])
                }
                if dp[i][j] == false && dp[i - 1][j] {
                    dp[i][j] = sArr1[i - 1] == sArr3[i + j - 1]
                }
            }
        }
        return dp.last!.last!
    }
}

Solution().isInterleave("aabcc", "dbbca", "aadbbcbcac")
