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
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        var result: TreeNode?
        if root1 != nil {
            result = root1
        }
        else if root2 != nil {
            result = root2
        }
        else {
            return result
        }
        if root1 != nil && root2 != nil {
            root1!.val = root1!.val + root2!.val
            result?.left = mergeTrees(root1?.left, root2?.left)
            result?.right = mergeTrees(root1?.right, root2?.right)
        }
        return result
    }
}
