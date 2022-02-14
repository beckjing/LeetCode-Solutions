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
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if contain(root?.left, p) && contain(root?.left, q) {
            return lowestCommonAncestor(root!.left!, p, q)
        }
        if contain(root?.right, p) && contain(root?.right, q) {
            return lowestCommonAncestor(root!.right!, p, q)
        }
        return root
    }
    
    func contain(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        if node1 == nil {
            return false
        }
        if node1 === node2 {
            return true
        }
        return contain(node1?.left, node2) || contain(node1?.right, node2)
    }
}
