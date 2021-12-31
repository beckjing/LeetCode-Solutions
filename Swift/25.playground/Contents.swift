import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let hair = ListNode()
        hair.next = head
        var pre: ListNode? = hair
        var tail: ListNode? = hair
        var next: ListNode?
        var cHead: ListNode? = head
        while tail?.next != nil {
            for _ in 1...k {
                tail = tail?.next
            }
            if tail == nil {
                break
            }
            else {
                next = tail?.next
                var prev = tail?.next
                var p = cHead
                while prev !== tail {
                    let nex = p?.next
                    p?.next = prev
                    prev = p
                    p = nex
                }
                let tmp = cHead
                cHead = tail
                tail = tmp
                pre?.next = cHead
                tail?.next = next
                pre = tail
                cHead = tail?.next
            }
        }
        return hair.next
    }
}
