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
    
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        if root != nil {
            let left = root?.left
            let right = root?.right
            root?.left = right
            root?.right = left
            mirrorTree(root?.left)
            mirrorTree(root?.right)
        }
        return root
    }
    
}
