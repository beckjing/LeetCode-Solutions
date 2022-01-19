import UIKit


class Solution {
    func numDecodings(_ s: String) -> Int {
        var sArr = Array<Character>()
        for char in s {
            sArr.append(char)
        }
        if sArr.first == "0" {
            return 0
        }
        var dp = [Int](repeating: 1, count: sArr.count + 1)
        for i in 1..<sArr.count {
            if sArr[i] == "0" {
                let pre = Int(String(sArr[i - 1]))!
                if  pre == 0 || pre >= 3 {
                    return 0
                }
                else {
                    dp[i + 1] = dp[i - 1]
                }
            }
            else if sArr[i - 1] == "0" {
                dp[i + 1] = dp[i]
            }
            else {
                var pre = ""
                pre.append(sArr[i - 1])
                pre.append(sArr[i])
                if Int(pre)! > 26 {
                    dp[i + 1] = dp[i]
                }
                else {
                    dp[i + 1] = dp[i] + dp[i - 1]
                }
            }
        }
        print(dp)
        return dp.last!
    }
}

Solution().numDecodings("2101")
