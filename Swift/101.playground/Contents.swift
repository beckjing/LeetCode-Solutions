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
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isSymmetric(left: root?.left, right: root?.right)
    }
    
    func isSymmetric(left: TreeNode?, right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left?.val != right?.val {
            return false
        }
        return isSymmetric(left: left?.left, right: right?.right) && isSymmetric(left: left?.right, right: right?.left)
    }
    
}
