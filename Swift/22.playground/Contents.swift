import UIKit

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var total_l = [[String]]()
        total_l.append([""])
        total_l.append(["()"])
        for i in 2...n {
            var l = [String]()
            for j in 0...i-1 {
                var now_left = total_l[j]
                var now_right = total_l[i-1-j]
                for n_left in now_left {
                    for n_right in now_right {
                        l.append("(\(n_left))\(n_right)")
                    }
                }
            }
            total_l.append(l)
        }
        return total_l[n]
    }
}

print(Solution().generateParenthesis(3))
