import UIKit

class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        let eCount = envelopes.count
        if eCount <= 1 {
            return eCount
        }
        let sortedE = envelopes.sorted { a, b in
            return a[0] > b[0]
        }
        var result = 1
        var dp = [Int](repeating: 1, count: eCount)
        for i in 1..<eCount {
            var maxDp = 0
            for j in 0..<i {
                if sortedE[j][0] > sortedE[i][0] && sortedE[j][1] > sortedE[i][1] {
                    if dp[j] > maxDp {
                        maxDp = dp[j]
                    }
                }
            }
            dp[i] = maxDp + 1
            if dp[i] > result {
                result = dp[i]
            }
        }
        return result
    }
}
