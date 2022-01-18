import UIKit

class Solution {
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var cache = Dictionary<String, Bool>()
        var result = 0
        var stk = [[Int]]()
        stk.append([0, 0])
        while stk.count > 0 {
            let last = stk.popLast()!
            let key = "\(last.first!)_\(last.last!)"
            if cache[key] == nil {
                cache[key] = true
                if checkValid(last.first!, last.last!, k) {
                    result += 1
                    if last.first! >= 1 {
                        stk.append([last.first! - 1, last.last!])
                    }
                    if last.first! < m - 1 {
                        stk.append([last.first! + 1, last.last!])
                    }
                    if last.last! >= 1 {
                        stk.append([last.first!, last.last! - 1])
                    }
                    if last.last! < n - 1 {
                        stk.append([last.first!, last.last! + 1])
                    }
                }
            }
        }
        return result
    }
    
    func checkValid(_ m: Int, _ n: Int, _ k: Int) -> Bool {
        let mSum = m / 100 + m / 10 + m % 10
        let nSum = n / 100 + n / 10 + n % 10
        return (mSum + nSum) <= k
    }
}

Solution().movingCount(16, 8, 4)
