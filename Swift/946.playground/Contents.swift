import UIKit

class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var tPushed = pushed
        var tPoped = popped
        var stk = [Int]()
        while tPushed.count > 0 {
            stk.append(tPushed.removeFirst())
            while tPoped.isEmpty == false && stk.last == tPoped.first {
                stk.popLast()
                tPoped.removeFirst()
            }
        }
        return stk.count == 0
    }
}

Solution().validateStackSequences([1,2,3,4,5], [4,5,3,2,1])
