import AppKit

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let sCount = s.count
        let wordSet = Set<String>(wordDict)
        var dp = [Bool](repeating: false, count: sCount + 1)
        dp[0] = true
        for i in 1...sCount {
            for j in 0..<i {
                if dp[j] && wordSet.contains(String(s[s.index(s.startIndex, offsetBy: j)..<s.index(s.startIndex, offsetBy: i)])) {
                    dp[i] = true
                }
            }
        }
        return dp.last!
    }
}


Solution().wordBreak("leetcode", ["leet","code"])
