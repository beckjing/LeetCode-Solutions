import UIKit

class Solution {
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        var stk = [Int]()
        var root = Int.max
        for i in 0..<postorder.count {
            let node = postorder[postorder.count - i - 1]
            if node > root {
                return false
            }
            while stk.last != nil && node < stk.last! {
                root = stk.popLast()!
            }
            stk.append(node)
        }
        return true
    }
}
