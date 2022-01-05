import Cocoa

class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n <= 2 {
            return 0
        }
        var result = Array<Bool>()
        var max = n - 1
        var resultCount = max - 1
        for i in 0..<n {
            result.append(true)
        }
        var start = 2
        while start <= (max / 2) {
            for i in 2...(max / start) {
                if result[start * i] == true {
                    resultCount -= 1
                    result[start * i] = false
                }
            }
            for j in (start + 1)...max {
                if result[j] == true {
                    start = j
                    break
                }
            }
        }
        return resultCount
    }
}
