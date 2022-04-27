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
    
    var numSet = Set<Int>()
    
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        if root == nil {
            return false
        }
        if numSet.contains(k - root!.val) {
            return true
        }
        numSet.insert(root!.val)
        return findTarget(root?.left, k) || findTarget(root?.right, k)
    }
}
