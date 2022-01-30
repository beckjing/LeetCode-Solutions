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
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        if root != nil {
            var travelValue = 0
            return convertBST_inner(root, &travelValue)
        }
        return nil
    }
    
    func convertBST_inner(_ origin: TreeNode?, _ travelValue: inout Int) -> TreeNode? {
        if origin != nil {
            let root = TreeNode()
            if origin!.right != nil {
                let convertR = convertBST_inner(origin!.right, &travelValue)!
                root.right = convertR
            }
            travelValue = origin!.val + travelValue
            root.val = travelValue
            if origin!.left != nil {
                let convertL = convertBST_inner(origin!.left, &travelValue)
                root.left = convertL
            }
            return root
        }
        return nil
    }
}
