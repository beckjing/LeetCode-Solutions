import Cocoa

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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var pre = [TreeNode]()
        var current = [TreeNode]()
        if root != nil {
            pre.append(root!)
        }
        while pre.count > 0 {
            result.append(pre.first!.val)
            for node in pre {
                if node.right != nil {
                    current.append(node.right!)
                }
                if node.left != nil {
                    current.append(node.left!)
                }
            }
            pre = current
            current = [TreeNode]()
        }
        return result
    }
}
