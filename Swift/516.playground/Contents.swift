import UIKit

class Solution {
    
    func longestPalindromeSubseq(_ s: String) -> Int {
        return longestPalindromeSubseq(Array<Character>(s))
    }
    
    func longestPalindromeSubseq(_ sArr: [Character]) -> Int {
        let sCount = sArr.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: sCount), count: sCount)
        for i in 0..<sCount {
            dp[i][i] = 1
        }
        for i in 0..<sCount {
            for j in 0..<sCount - i {
                let left = j
                let right = j + i
                if right - left == 0 {
                    dp[left][right] = 1
                }
                else if right - left == 1 {
                    dp[left][right] = 1
                    if sArr[right] == sArr[left] {
                        dp[left][right] += 1
                    }
                }
                else {//3个以上
                    if sArr[left] == sArr[right] {
                        dp[left][right] = dp[left + 1][right - 1] + 2
                    }
                    else {
                        dp[left][right] = max(dp[left][right - 1], dp[left + 1][right])
                    }
                }
            }
        }
        return dp[0][sCount - 1]
    }
}

Solution().longestPalindromeSubseq("cbbd")
