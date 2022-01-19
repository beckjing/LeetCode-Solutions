import UIKit

class Solution {
    func translateNum(_ num: Int) -> Int {
        var sArr = Array<Character>()
        for char in String(num) {
            sArr.append(char)
        }
        var dp = [Int](repeating: 1, count: sArr.count + 1)
        for i in 1..<sArr.count {
            if sArr[i - 1] == "0" {
                dp[i + 1] = dp[i]
            }
            else {
                var pre = ""
                pre.append(sArr[i - 1])
                pre.append(sArr[i])
                if Int(pre)! > 25 {
                    dp[i + 1] = dp[i]
                }
                else {
                    dp[i + 1] = dp[i] + dp[i - 1]
                }
            }
        }
        return dp.last!
    }
}
