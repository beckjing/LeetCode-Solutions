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

class FindElements {
    
    var numberSet = Set<Int>()
    
    init(_ root: TreeNode?) {
        dfs(root: root, value: 0)
    }
    
    func dfs(root: TreeNode?, value: Int) {
        if root != nil {
            root!.val = value
            self.numberSet.insert(value)
            dfs(root: root!.left, value: 2 * value + 1)
            dfs(root: root!.right, value: 2 * value + 2)
        }
    }
    
    func find(_ target: Int) -> Bool {
        return self.numberSet.contains(target)
    }
}

