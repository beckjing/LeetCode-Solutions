import UIKit

class Solution {
    
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        return combinationSum3_inner(k, n, 1, 9)
    }
    
    func combinationSum3_inner(_ k: Int, _ n: Int, _ start: Int, _ end: Int) -> [[Int]] {
        var result = [[Int]]()
        if n == 0 || k == 0 {
            return result
        }
        if k == 1 {
            if n >= start && n <= end {
                for i in start...end {
                    if n == i {
                        result.append([i])
                        return result
                    }
                }
            }
        }
        var index = start
        while index <= n && index <= end {
            let res = combinationSum3_inner(k - 1, n - index, index + 1, end)
            for subRes in res {
                var tmp = [Int]()
                tmp.append(index)
                tmp.append(contentsOf: subRes)
                result.append(tmp)
            }
            index += 1
        }
        return result
    }
    
}
