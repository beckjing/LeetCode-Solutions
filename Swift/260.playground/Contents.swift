import UIKit

class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var ret = 0
        for num in nums {
            ret ^= num
        }
        var dit = 1
        while (dit & ret) == 0 {
            dit = dit << 1
        }
        var a = 0
        var b = 0
        for num in nums {
            if (dit & num) == 0 {
                a ^= num
            }
            else {
                b ^= num
            }
        }
        return [a, b]
    }
}
