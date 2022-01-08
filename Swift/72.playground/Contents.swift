import UIKit

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let wCount1 = word1.count
        let wCount2 = word2.count
        if wCount1 * wCount2 == 0 {
            return max(wCount1, wCount2)
        }
        var wordArr1 = Array<Character>()
        var wordArr2 = Array<Character>()
        for char in word1 {
            wordArr1.append(char)
        }
        for char in word2 {
            wordArr2.append(char)
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: wCount2 + 1), count: wCount1 + 1)
        for i in 0...wCount1 {
            dp[i][0] = i
        }
        for j in 0...wCount2 {
            dp[0][j] = j
        }
        for i in 1...wCount1 {
            for j in 1...wCount2 {
                if wordArr1[i - 1] == wordArr2[j - 1] {
                    dp[i][j] = min(dp[i - 1][j] + 1, dp[i][j - 1] + 1, dp[i - 1][j - 1])
                }
                else {
                    dp[i][j] = 1 + min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1])
                }
            }
        }
        print(dp)
        return dp[wCount1][wCount2]
    }
}

Solution().minDistance("a", "ab")
