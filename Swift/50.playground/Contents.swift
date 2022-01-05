import Cocoa

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1.0
        }
        var tmpArr = Array<Double>()
        var tmpX = x
        var times = 1
        while times <= n {
            tmpArr.append(tmpX)
            tmpX *= tmpX
            times *= 2
        }
        times = 1
        var index = 0
        var remain = n
        var result = 0.0
        while remain > 0 {
            while times * 2 <= remain {
                times *= 2
                index += 1
            }
            result *= tmpArr[index]
            remain -= times
            times = 1
            index = 0
        }
        if n > 0 {
            return result
        }
        else {
            return 1.0 / result
        }
    }
}

print(Solution().myPow(2.0, 10))
