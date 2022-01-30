import UIKit

class Solution {
    func countSubstrings(_ s: String) -> Int {
        return countSubStrings([Character](s))
    }
    
    func countSubStrings(_ sArr: [Character]) -> Int {
        let sCount = sArr.count
        if sCount == 0 {
            return 0
        }
        var dp = [Int](repeating: 1, count: sCount)
        for i in 1..<sCount {
            dp[i] = dp[i - 1]
            for j in 0...i {
                if check(Array(sArr[j...i])) {
                    dp[i] += 1
                }
            }
        }
        return dp.last!
    }
    
    func check(_ sArr: [Character]) -> Bool {
        let sCount = sArr.count
        if sCount >= 2 {
            let middle = sCount / 2
            for i in 0..<middle {
                if sArr[i] != sArr[sCount - i - 1] {
                    return false
                }
            }
        }
        return true
    }
}


