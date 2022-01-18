import Cocoa

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        else if coins.count == 1 {
            if amount < coins.first! {
                return -1
            }
        }
        var dp = [Int](repeating: -1, count: amount + 1)
        dp[0] = 0
        for coin in coins {
            if coin <= amount {
                dp[coin] = 1
            }
        }
        for i in 1...amount {
            var min = dp[i]
            for coin in coins {
                if i - coin > 0 && dp[i - coin] > 0 {
                    if min < 0 || (1 + dp[i - coin]) < min {
                        min = 1 + dp[i - coin]
                    }
                }
            }
            dp[i] = min
        }
        return dp.last!
    }
}

print(Solution().coinChange([1,2147483647], 2))

