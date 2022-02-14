import UIKit

class Solution {
    var cache = Dictionary<Int, Int>()
    func findMinFibonacciNumbers(_ k: Int) -> Int {
        var fArr = [Int]()
        var f_0 = 0
        var f_1 = 1
        var f_2 = 1
        while f_2 <= k {
            fArr.append(f_2)
            f_0 = f_1
            f_1 = f_2
            f_2 = f_0 + f_1
        }
        return findSet(k, fArr.reversed(), 0)
    }
    
    func findSet(_ k: Int, _ nArr: [Int], _ start: Int) -> Int {
        var index = start
        while nArr[index] > k {
            index += 1
        }
        if k == nArr[index] {
            return 1
        }
        return 1 + findSet(k - nArr[index], nArr, index)
    }
}

print(Solution().findMinFibonacciNumbers(513314))
