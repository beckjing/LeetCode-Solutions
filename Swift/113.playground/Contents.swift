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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var result = [[Int]]()
        if root != nil {
            if root?.left == nil && root?.right == nil {
                if root!.val == targetSum {
                    result.append([root!.val])
                }
                return result
            }
            if root?.left != nil {
                let subRes = pathSum(root?.left, targetSum - root!.val)
                for res in subRes {
                    var tmp = [Int]()
                    tmp.append(root!.val)
                    tmp.append(contentsOf: res)
                    result.append(tmp)
                }
            }
            if root?.right != nil {
                let subRes = pathSum(root?.right, targetSum - root!.val)
                for res in subRes {
                    var tmp = [Int]()
                    tmp.append(root!.val)
                    tmp.append(contentsOf: res)
                    result.append(tmp)
                }
            }
        }
        return result
    }
}
