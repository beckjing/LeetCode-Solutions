import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if A == nil || B == nil {
            return false
        }
        if isEqualNode(A, B) {
            return true
        }
        else {
            return isSubStructure(A?.left, B) || isSubStructure(A?.right, B)
        }
    }
    
    func isEqualNode(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if A == nil && B == nil {
            return true
        }
        if A?.val == B?.val {
            var result = true
            if B?.left != nil {
                result = result && isEqualNode(A?.left, B?.left)
            }
            if B?.right != nil {
                result = result && isEqualNode(A?.right, B?.right)
            }
            return result
        }
        return false
    }
}
