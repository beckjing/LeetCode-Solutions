import UIKit

class Solution {
    func singleNumbers(_ nums: [Int]) -> [Int] {
        var a = 0
        var b = 0
        var result = 0
        for num in nums {
            result ^= num
        }
        var div = 1
        while (div & result) == 0 {
            div = div << 1
        }
        for num in nums {
            if (div & num) == 0 {
                a ^= num
            }
            else {
                b ^= num
            }
        }
        return [a, b]
    }
}
