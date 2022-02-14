class Solution {
    
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        if amount == 0 {
            return 1
        }
        return change_inner(amount, coins.sorted())
    }
    
    func change_inner(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: amount + 1)
        dp[0] = 1
        for coin in coins {
            if coin <= amount {
                for i in coin...amount {
                    dp[i] += dp[i - coin]
                }
            }
            else {
                break
            }
        }
        return dp.last!
    }
}

print(Solution().change(100, []))
