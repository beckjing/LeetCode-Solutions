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

    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var resultArr = [Int]()
        middleTravel(node: root, result: &resultArr)
        return resultArr[k - 1]
    }
    
    func middleTravel(node: TreeNode?, result: inout [Int]) {
        if node == nil {
            return
        }
        if node?.left != nil {
            middleTravel(node: node?.left, result: &result)
        }
        result.append(node!.val)
        if node?.right != nil {
            middleTravel(node: node?.right, result: &result)
        }
    }
    
}
