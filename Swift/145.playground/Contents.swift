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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root != nil {
            if root!.left != nil {
                result.append(contentsOf: postorderTraversal(root?.left))
            }
            if root!.right != nil {
                result.append(contentsOf: postorderTraversal(root?.right))
            }
            result.append(root!.val)
        }
        return result
    }
}
