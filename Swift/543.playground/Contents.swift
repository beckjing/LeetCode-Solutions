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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var result = 0
        if root != nil {
            let nodeLength = height(root?.left) + height(root?.right)
            result = max(diameterOfBinaryTree(root?.left), diameterOfBinaryTree(root?.right))
            return max(nodeLength, result)
        }
        return result
    }
    
    func height(_ root: TreeNode?) -> Int {
        if root != nil {
            return 1 + max(height(root?.left), height(root?.right))
        }
        return 0
    }
}
