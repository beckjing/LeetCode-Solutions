import Cocoa

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let hair = ListNode(0, head)
        var pre: ListNode? = hair
        var cur = head
        var next = head
        while cur != nil {
            while next!.next?.val == cur!.val {
                next = next?.next
            }
            if cur !== next {
                pre!.next = next?.next
                cur = pre?.next
            }
            else {
                pre = cur
                cur = cur?.next
            }
            next = cur
        }
        return hair.next
    }
}
