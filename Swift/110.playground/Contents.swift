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
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root != nil {
            let leftHeight = height(root?.left)
            let rightHeight = height(root?.right)
            return isBalanced(root?.left) && isBalanced(root?.right) && abs(leftHeight - rightHeight) < 2
        }
        return true
    }
    
    func height(_ root: TreeNode?) -> Int {
        if root != nil {
            return 1 + max(height(root?.left), height(root?.right))
        }
        return 0
    }
}
