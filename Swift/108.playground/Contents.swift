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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        var root: TreeNode?
        let nCount = nums.count
        if nCount > 3 {
            let middle = nCount / 2
            root = TreeNode(nums[middle])
            if middle > 0 {
                root?.left = sortedArrayToBST(Array(nums[0..<middle]))
            }
            if middle < nCount - 1 {
                root?.right = sortedArrayToBST(Array(nums[middle + 1..<nCount]))
            }
        }
        else if nCount > 0 {
            let middle = nCount / 2
            root = TreeNode(nums[middle])
            if 0 != middle {
                let left = TreeNode(nums[0])
                root!.left = left
            }
            if middle != nCount - 1 {
                let right = TreeNode(nums[nCount - 1])
                root?.right = right
            }
        }
        return root
    }
}
