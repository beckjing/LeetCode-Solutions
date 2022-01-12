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
    
    
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return self.construct(nums, left: 0, right: nums.count - 1)
    }
    
    func construct(_ nums: [Int], left: Int, right: Int) -> TreeNode? {
        let maxIndex = findMaxIndex(nums, left: left, right: right)
        if maxIndex >= 0 {
            let root = TreeNode(nums[maxIndex])
            root.left = construct(nums, left: left, right: maxIndex - 1)
            root.right = construct(nums, left: maxIndex + 1, right: right)
            return root
        }
        return nil
    }
    
    func findMaxIndex(_ nums: [Int], left: Int, right: Int) -> Int {
        if left > right {
            return -1
        }
        else if left == right {
            return left
        }
        var maxIndex = left
        for i in left + 1...right {
            if nums[i] > nums[maxIndex] {
                maxIndex = i
            }
        }
        return maxIndex
    }
    
}

Solution().constructMaximumBinaryTree([3,2,1,6,0,5])
