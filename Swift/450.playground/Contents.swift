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
    
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        if root != nil {
            return find(root!, nil, key)
        }
        return nil
    }
    
    func find(_ root: TreeNode, _ parent: TreeNode?, _ key: Int) -> TreeNode? {
        if root.val < key {
            if root.right != nil {
                root.right = find(root.right!, root, key)
            }
            return root
        }
        else if root.val > key {
            if root.left != nil {
                root.left = find(root.left!, root, key)
            }
            return root
        }
        else {
            return rebuild(root, parent, key)
        }
    }
    
    func find_min(_ root: TreeNode) -> Int {
        if root.left != nil {
           return find_min(root.left!)
        }
        return root.val
    }
    
    func find_max(_ root: TreeNode) -> Int {
        if root.right != nil {
            return find_max(root.right!)
        }
        return root.val
    }
    
    func rebuild(_ root: TreeNode, _ parent: TreeNode?, _ key: Int) -> TreeNode? {
        if root.right != nil {
            root.val = find_min(root.right!)
            root.right = deleteNode(root.right, root.val)
        }
        else if root.left != nil {
            root.val = find_max(root.left!)
            root.left = deleteNode(root.left, root.val)
        }
        else {
            return nil
        }
        return root
    }
}
