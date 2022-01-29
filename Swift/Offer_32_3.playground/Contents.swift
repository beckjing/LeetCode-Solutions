import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        if root != nil {
            var stk = Array<TreeNode>()
            var reverse = false
            stk.append(root!)
            while stk.last != nil {
                var tmp = Array<TreeNode>()
                for node in stk {
                    if node.left != nil {
                        tmp.append(node.left!)
                    }
                    if node.right != nil {
                        tmp.append(node.right!)
                    }
                }
                let tmpS = reverse ? stk.reversed() : stk
                var res = [Int]()
                for node in tmpS {
                    res.append(node.val)
                }
                stk = tmp
                result.append(res)
                reverse = !reverse
            }
        }
        return result
    }
}
