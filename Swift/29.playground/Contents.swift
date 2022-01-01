import Cocoa

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == 0 {
            return 0
        }
        if divisor == 1 {
            return dividend
        }
        if divisor == -1 {
            if dividend > Int32.min {
                return 0 - dividend
            }
            return Int(Int32.max)
        }
        let a: Int64 = Int64(abs(dividend))
        let b: Int64 = Int64(abs(divisor))
        var sign = 1
        if (dividend > 0 && divisor < 0) || (dividend < 0 && divisor > 0) {
            sign = -1
        }
        let result = div(a: a, b: b)
        if sign == -1 {
            return 0 - result
        }
        if result > Int32.max {
            return Int(Int32.max)
        }
        return result
    }
    
    func div(a: Int64, b: Int64) -> Int {
        if a < b {
            return 0
        }
        var count: Int64 = 1
        var tmpB: Int64 = b
        while tmpB + tmpB <= a {
            count += count
            tmpB += tmpB
        }
        return Int(count) + div(a: a - tmpB, b: b)
    }
}

print(Solution().divide(-2147483648, -1))
