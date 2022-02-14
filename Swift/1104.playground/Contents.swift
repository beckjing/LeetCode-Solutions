import UIKit

class Solution {
    func pathInZigZagTree(_ label: Int) -> [Int] {
        var result = [Int]()
        var times = 0
        var remain = label
        var pre = 1
        while remain / 2 > 0 {
            remain = remain / 2
            times += 1
            pre *= 2
        }
        remain = label
        
        while times >= 0 {
            result.append(remain)
            if times % 2 == 0 {
                var index = remain - pre
                index /= 2
                pre /= 2
                remain = 2 * pre - index - 1
            }
            else {
                var index = 2 * pre - remain - 1
                index /= 2
                pre /= 2
                remain = pre + index
            }
            times -= 1
        }
        return result.reversed()
    }
}

print(Solution().pathInZigZagTree(26))
