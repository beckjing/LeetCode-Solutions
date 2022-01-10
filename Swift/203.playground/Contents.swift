import Cocoa

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let hair = ListNode(val - 1, head)
        var pre: ListNode? = hair
        var cur = head
        while cur != nil {
            if cur!.val == val {
                pre?.next = cur?.next
            }
            else {
                pre = cur
            }
            cur = cur?.next
        }
        return hair.next
    }
}
