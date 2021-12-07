import UIKit

class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 3 {
            return n
        }
        var f_n_2 = 2
        var f_n_1 = 3
        var f_n = 0
        for i in 4...n {
            f_n = f_n_1 + f_n_2
            f_n_2 = f_n_1
            f_n_1 = f_n
        }
        return f_n
    }
}
