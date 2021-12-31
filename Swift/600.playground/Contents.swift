import Cocoa

class Solution {
    func findIntegers(_ n: Int) -> Int {
        if n <= 2 {
            return n + 1
        }
        let binary = stringToB(n)
        let bCount = binary.count
        var dp = Array<Int>()
        var result = 0
        dp.append(1)
        dp.append(2)
        for i in 2..<bCount {
            dp.append(dp[i-1] + dp[i-2])
        }
        var index = 0
        for b in binary {
            if b == "1" {
                result += dp[bCount - index - 1]
                if index != 0 && binary[binary.index(binary.startIndex, offsetBy: index - 1)] == "1" {
                    return result
                }
            }
            index += 1
        }
        return result + 1
    }
    
    func stringToB(_ n: Int) -> String {
        var result = ""
        var remain = n
        while remain > 0 {
            result.append(String(remain % 2))
            remain /= 2
        }
        return String(result.reversed())
    }
}


