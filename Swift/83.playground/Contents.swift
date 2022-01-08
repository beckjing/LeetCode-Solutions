import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        var currentVal = head?.val
        var curNode: ListNode? = head
        while curNode?.next != nil {
            if currentVal == curNode!.next!.val {
                curNode!.next = curNode!.next!.next
            }
            else {
                currentVal = curNode!.next!.val
                curNode = curNode!.next
            }
        }
        return head
    }
}
