import UIKit



class Solution {
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        if k == 1 {
            for i in 1...n {
                result.append([i])
            }
        }
        else {
            for i in k...n {
                for tmp in combine(i - 1, k - 1) {
                    var res = [Int]()
                    res.append(i)
                    res.append(contentsOf: tmp)
                    result.append(res)
                }
            }
        }
        return result
    }
}


Solution().combine(4, 2)
