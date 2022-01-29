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
    
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if postorder.count > 0 {
            let root = TreeNode(postorder.last!)
            var index = inorder.count - 1
            while inorder[index] != root.val {
                index -= 1
            }
            
            if index < inorder.count - 1 {
                root.right = buildTree(Array(inorder[index + 1...inorder.count - 1]), Array(postorder[index...postorder.count - 2]))
            }
            if 0 < index {
                root.left = buildTree(Array(inorder[0..<index]), Array(postorder[0..<index]))
            }
            return root
        }
        return nil
    }
}
