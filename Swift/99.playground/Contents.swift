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
    
    var stk = [TreeNode]()
    
    func recoverTree(_ root: TreeNode?) {
        self.stk.removeAll()
        self.travel(root)
        var changeNode = [Int]()
        var pre = self.stk.first!
        var index = 1
        while index < self.stk.count {
            let node = self.stk[index]
            if node.val < pre.val {
                changeNode.append(index - 1)
            }
            pre = node
            index += 1
        }
        let first = self.stk[changeNode.first!]
        let last = self.stk[changeNode.last! + 1]
        let tmp = first.val
        first.val = last.val
        last.val = tmp
    }
    
    func travel(_ root: TreeNode?) {
        if root != nil {
            travel(root!.left)
            self.stk.append(root!)
            travel(root!.right)
        }
    }
    
}
