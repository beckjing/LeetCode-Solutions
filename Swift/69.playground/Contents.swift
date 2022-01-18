import Cocoa

class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 0 {
            return 0
        }
        var start = 1
        var end = 2
        while x >= end * end {
            start = end
            end *= end
        }
        if x > start {
            while (end - start) > 1 {
                let middle = (start + end) / 2
                if x < middle * middle {
                    end = middle
                }
                else if x > middle * middle {
                    start = middle
                }
                else {
                    return middle
                }
            }
        }
        return start
    }
}
