import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class Solution {
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        var result = root!.val
        var stk = Array<TreeNode>()
        stk.append(root!)
        while stk.count > 0 {
            result = stk.first!.val
            var tmp = Array<TreeNode>()
            for node in stk {
                if node.left != nil {
                    tmp.append(node.left!)
                }
                if node.right != nil {
                    tmp.append(node.right!)
                }
            }
            stk = tmp
        }
        return result
    }
}
