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
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var result = [String]()
        if root != nil {
            if root!.left == nil && root!.right == nil {
                result.append("\(root!.val)")
            }
            if root!.left != nil {
                let lResult = binaryTreePaths(root!.left!)
                for lPath in lResult {
                    var tmp = ""
                    tmp.append("\(root!.val)->")
                    tmp.append(lPath)
                    result.append(tmp)
                }
            }
            if root!.right != nil {
                let rResult = binaryTreePaths(root!.right!)
                for rPath in rResult {
                    var tmp = ""
                    tmp.append("\(root!.val)->")
                    tmp.append(rPath)
                    result.append(tmp)
                }
            }
        }
        return result
    }
    
}
