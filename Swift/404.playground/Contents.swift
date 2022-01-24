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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        var result = 0
        if root != nil {
            if root?.left != nil {
                if root?.left?.left == nil && root?.left?.right == nil {
                    result += root!.left!.val
                }
                else {
                    result += sumOfLeftLeaves(root?.left)
                }
            }
            result += sumOfLeftLeaves(root?.right)
        }
        return result
    }
}
