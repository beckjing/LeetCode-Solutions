import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

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
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        var numArr = [Int]()
        var start = head
        while start != nil {
            numArr.append(start!.val)
            start = start?.next
        }
        if numArr.count > 0 {
            return sortedListToBST(nums: numArr)
        }
        return nil
    }
    
    func sortedListToBST(nums: [Int]) -> TreeNode? {
        if nums.count > 0 {
            if nums.count <= 3 {
                let middle = nums.count / 2
                let root = TreeNode(nums[middle])
                if middle > 0 {
                    root.left = TreeNode(nums.first!)
                }
                if middle < nums.count - 1 {
                    root.right = TreeNode(nums.last!)
                }
                return root
            }
            else {
                let middle = nums.count / 2
                let root = TreeNode(nums[middle])
                root.left = sortedListToBST(nums: Array(nums[0..<middle]))
                root.right = sortedListToBST(nums: Array(nums[middle + 1..<nums.count]))
                return root
            }
        }
        return nil
    }
}
