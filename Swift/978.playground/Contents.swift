import UIKit

class Solution {
    func maxTurbulenceSize(_ arr: [Int]) -> Int {
        let aCount = arr.count
        var dp = [Int](repeating: 1, count: aCount)
        var result = 1
        for i in 1..<aCount {
            if arr[i - 1] != arr[i] {
                if dp[i - 1] == 1 {
                    dp[i] = 2
                }
                else if (arr[i - 1] > arr[i]) && (arr[i - 1] > arr[i - 2]) {
                    dp[i] = dp[i - 1] + 1
                }
                else if (arr[i - 1] < arr[i]) && (arr[i - 1] < arr[i - 2]) {
                    dp[i] = dp[i - 1] + 1
                }
                else {
                    dp[i] = 2
                }
            }
            result = max(result, dp[i])
        }
        return result
    }
}

Solution().maxTurbulenceSize([9,4,2,10,7,8,8,1,9])
