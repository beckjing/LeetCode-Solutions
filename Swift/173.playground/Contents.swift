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

class BSTIterator {
    
    var root: TreeNode?
    var stk = [TreeNode]()
    var initStk = false
    
    init(_ root: TreeNode?) {
        self.root = root
    }
    
    func initStack() {
        self.initStk = true
        self.travel(self.root)
    }
    
    func travel(_ root: TreeNode?) {
        if root != nil {
            self.travel(root?.left)
            self.stk.append(root!)
            self.travel(root?.right)
        }
    }
    
    func next() -> Int {
        if initStk == false {
            self.initStack()
        }
        let node = self.stk.removeFirst()
        return node.val
    }
    
    func hasNext() -> Bool {
        if initStk == false {
            self.initStack()
        }
        return self.stk.count > 0
    }
}
