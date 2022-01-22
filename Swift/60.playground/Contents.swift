import UIKit

class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var result = ""
        var numArr = [Bool](repeating: true, count: n + 1)
        var factArr = [Int](repeating: 1, count: n + 1)
        for i in 1...n {
            factArr[i] = factArr[i - 1] * i
        }
        var kC = k - 1
        for i in 1...n {
            var order = kC / factArr[n - i] + 1
            for j in 1...n {
                order -= numArr[j] ? 1 : 0
                if order == 0 {
                    numArr[j] = false
                    result.append(String(j))
                    break
                }
            }
            kC %= factArr[n - i]
        }
        return result
    }
}

Solution().getPermutation(3, 3)
