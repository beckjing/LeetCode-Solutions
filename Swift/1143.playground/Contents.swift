import UIKit

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let tArr1 = Array<Character>(text1)
        let tArr2 = Array<Character>(text2)
        let tCount1 = tArr1.count
        let tCount2 = tArr2.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: tCount2), count: tCount1)
        dp[0][0] = tArr1.first == tArr2.first ? 1 : 0
        for i in 1..<tCount1 {
            dp[i][0] = tArr1[i] == tArr2.first ? 1 : dp[i - 1][0]
        }
        for j in 1..<tCount2 {
            dp[0][j] = tArr2[j] == tArr1.first ? 1 : dp[0][j - 1]
        }
        for i in 1..<tCount1 {
            for j in 1..<tCount2 {
                if tArr1[i] == tArr2[j] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                }
                else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp.last!.last!
    }
}

Solution().longestCommonSubsequence("abc", "def")
