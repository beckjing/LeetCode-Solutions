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
    
    func rob(_ root: TreeNode?) -> Int {
        let result = dfs(root)
        return max(result.first!, result.last!)
    }
    
    func dfs(_ node: TreeNode?) -> [Int] {
        if node != nil {
            let left = dfs(node?.left)
            let right = dfs(node?.right)
            let selected = node!.val + left.last! + right.last!
            let notSelected = max(left.first!, left.last!) + max(right.first!, right.last!)
            return [selected, notSelected]
        }
        return [0, 0]
    }
}
