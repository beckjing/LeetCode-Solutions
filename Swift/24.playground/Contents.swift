import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var singleNode = head
        var doubleNode = head?.next
        var result: ListNode?
        if doubleNode == nil {
            result = singleNode
        }
        else {
            result = doubleNode
        }
        var preLast: ListNode?
        while singleNode != nil && doubleNode != nil {
            if preLast != nil {
                preLast?.next = doubleNode
            }
            singleNode?.next = doubleNode?.next
            doubleNode?.next = singleNode
            preLast = singleNode
            singleNode = singleNode?.next
            doubleNode = singleNode?.next
        }
        return result
    }
}
