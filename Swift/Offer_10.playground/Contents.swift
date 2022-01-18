import Cocoa

class Solution {
    func fib(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        var f_0 = 0
        var f_1 = 1
        var f_n = 0
        for _ in 2...n {
            f_n = f_0 + f_1
            f_0 = f_1
            f_1 = f_n
            if f_n > 1000000007 {
                f_n %= 1000000007
                f_0 %= 1000000007
                f_1 %= 1000000007
            }
        }
        return f_n
    }
}

print(Solution().fib(45))
