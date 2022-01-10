import Cocoa

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        let hair = ListNode(0)
        hair.next = head
        var cur = head
        var pre: ListNode? = hair
        while cur != nil {
            if cur!.val == val {
                pre!.next = cur?.next?.next
            }
            pre = cur
            cur = cur?.next
        }
        return hair.next
    }
}
