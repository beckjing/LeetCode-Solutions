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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 || inorder.count == 0 {
            return nil
        }
        let root = TreeNode(preorder.first!)
        if preorder.count > 1 {
            var index = 0
            for i in 0..<inorder.count {
                if inorder[i] == root.val {
                    index = i
                    break
                }
            }
            if index > 0 {
                root.left = buildTree(Array<Int>(preorder[1...index]), Array<Int>(inorder[0..<index]))
            }
            if index < preorder.count - 1 {
                root.right = buildTree(Array<Int>(preorder[index + 1..<preorder.count]), Array<Int>(inorder[index + 1..<inorder.count]))
            }
        }
        return root
    }
}


Solution().buildTree([1, 2], [1, 2])
