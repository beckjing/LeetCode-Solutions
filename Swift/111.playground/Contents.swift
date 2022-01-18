import Cocoa

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
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        if root?.left == nil && root?.right == nil {
            return 1
        }
        var min = Int.max
        if root?.left != nil {
            let leftC = minDepth(root?.left)
            min = min < leftC ? min : leftC
        }
        if root?.right != nil {
            let rightC = minDepth(root?.right)
            min = min < rightC ? min : rightC
        }
        return 1 + min
    }
}
