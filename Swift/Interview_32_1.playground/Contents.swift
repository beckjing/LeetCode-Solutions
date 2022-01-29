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
    func levelOrder(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root != nil {
            var stk = Array<TreeNode>()
            stk.append(root!)
            while stk.count > 0 {
                var tmp = Array<TreeNode>()
                for node in stk {
                    result.append(node.val)
                    if node.left != nil {
                        tmp.append(node.left!)
                    }
                    if node.right != nil {
                        tmp.append(node.right!)
                    }
                }
                stk = tmp
            }
        }
        return result
    }
}
