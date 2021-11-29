import UIKit

class Solution {
    func fib(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        else if n == 1 {
            return 1
        }
        var f_n_2 = 0
        var f_n_1 = 1
        var f_n = 0
        for i in 2...n {
            f_n = f_n_1 + f_n_2
            f_n_2 = f_n_1
            f_n_1 = f_n
        }
        return f_n
    }
}

