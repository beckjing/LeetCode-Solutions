import UIKit

class Solution {
    func countBits(_ n: Int) -> [Int] {
        var dp = [Int](repeating: 0, count: n + 1)
        if n == 0 {
            return dp
        }
        dp[1] = 1
        if n == 1 {
            return dp
        }
        dp[2] = 1
        if n == 2 {
            return dp
        }
        for i in 3...n {
            let a = i % 2
            let b = i / 2
            dp[i] = dp[b] + a
        }
        return dp
    }
}
