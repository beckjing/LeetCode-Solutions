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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var level = Array<TreeNode?>()
        var result = [[Int]]()
        if root != nil {
            level.append(root)
            while level.count > 0 {
                var curLevel = [Int]()
                var nextLevel = Array<TreeNode?>()
                for node in level {
                    curLevel.append(node!.val)
                }
                result.append(curLevel)
                for node in level {
                    if node?.left != nil {
                        nextLevel.append(node?.left)
                    }
                    if node?.right != nil {
                        nextLevel.append(node?.right)
                    }
                }
                level = nextLevel
            }
        }
        return result
    }
}
