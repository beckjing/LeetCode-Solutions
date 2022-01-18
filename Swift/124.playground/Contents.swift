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
    
    var maxSum = Int.min
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        maxGain(root!)
        return maxSum
    }
    
    func maxGain(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let leftGain = max(0, maxGain(root?.left))
        let rightGain = max(0, maxGain(root?.right))
        let gain = leftGain + root!.val + rightGain
        maxSum = max(gain, maxSum)
        return root!.val + max(leftGain, rightGain)
    }
}
