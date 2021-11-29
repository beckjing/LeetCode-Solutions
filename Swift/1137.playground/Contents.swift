import UIKit

class Solution {
    func tribonacci(_ n: Int) -> Int {
        if n <= 1  {
            return n
        }
        if n == 2 {
            return 1
        }
        var f_n_3 = 0
        var f_n_2 = 1
        var f_n_1 = 1
        var f_n = 0
        for i in 3...n {
            f_n = f_n_1 + f_n_2 + f_n_3
            f_n_3 = f_n_2
            f_n_2 = f_n_1
            f_n_1 = f_n
        }
        return f_n
    }
}
