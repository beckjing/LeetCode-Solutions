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
    
    func flatten(_ root: TreeNode?) {
        if root == nil {
            return
        }
        let left = root?.left
        let right = root?.right
        root?.left = nil
        root?.right = nil
        var rightRoot = root
        if left != nil {
            flatten(left)
            root?.right = left
            while rightRoot?.right != nil {
                rightRoot = rightRoot?.right
            }
        }
        if right != nil {
            flatten(right)
            rightRoot?.right = right
        }
    }
}
