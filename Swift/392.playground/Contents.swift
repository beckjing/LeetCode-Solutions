import UIKit

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.count > t.count {
            return false
        }
        if s.count == 0 {
            return true
        }
        var sArr = Array<Character>()
        var tArr = Array<Character>()
        for char in s {
            sArr.append(char)
        }
        for char in t {
            tArr.append(char)
        }
        return isSubsequence(sArr, tArr)
    }
    
    func isSubsequence(_ s: Array<Character>, _ t: Array<Character>) -> Bool {
        let sCount = s.count
        let tCount = t.count
        var dp = [Int](repeating: 0, count: tCount)
        dp[0] = s.first! == t.first! ? 1 : 0
        var index = 1
        while index < tCount {
            if t[index] == s[dp[index - 1]] {
                dp[index] = dp[index - 1] + 1
                if dp[index] == sCount {
                    return true
                }
            }
            else {
                dp[index] = dp[index - 1]
            }
            index += 1
        }
        return dp.last! == sCount
    }
}


Solution().isSubsequence("abc", "ahbgdc")
