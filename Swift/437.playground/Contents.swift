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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        return pathSum_New(root, targetSum)
    }
    
    func pathSum_New(_ root: TreeNode?, _ targetSum: Int) -> Int {
        var result = 0
        if root != nil {
            if root!.val == targetSum {
                result += 1
            }
            result += pathSum_New(root?.left, targetSum)
            result += pathSum_New(root?.right, targetSum)
            result += pathSum_Linked(root?.left, targetSum - root!.val)
            result += pathSum_Linked(root?.right, targetSum - root!.val)
        }
        return result
    }
    
    func pathSum_Linked(_ root: TreeNode?, _ targetSum: Int) -> Int {
        var result = 0
        if root != nil {
            if root!.val == targetSum {
                result += 1
            }
            result += pathSum_Linked(root?.left, targetSum - root!.val)
            result += pathSum_Linked(root?.right, targetSum - root!.val)
        }
        return result
    }
}
