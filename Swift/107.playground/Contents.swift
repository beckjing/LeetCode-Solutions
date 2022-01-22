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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        var stk = [TreeNode]()
        if root != nil {
            stk.append(root!)
            while stk.count > 0 {
                var tmp = [TreeNode]()
                var level = [Int]()
                for node in stk {
                    level.append(node.val)
                    if node.left != nil {
                        tmp.append(node.left!)
                    }
                    if node.right != nil {
                        tmp.append(node.right!)
                    }
                }
                result.append(level)
                stk = tmp
            }
        }
        return result.reversed()
    }
}
