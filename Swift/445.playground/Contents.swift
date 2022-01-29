import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return reverse(addTwoNumbers_inner(reverse(l1), reverse(l2)))
    }
    func addTwoNumbers_inner(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return nil
        }
        var tmp = 0
        var l1cur = l1
        var l2cur = l2
        let hair = ListNode()
        var cur = hair
        while l1cur != nil && l2cur != nil {
            let num = l1cur!.val + l2cur!.val + tmp
            tmp = (num / 10)
            let node = ListNode(num % 10)
            cur.next = node
            cur = node
            l1cur = l1cur?.next
            l2cur = l2cur?.next
        }
        while l1cur != nil {
            let num = l1cur!.val + tmp
            tmp = (num / 10)
            let node = ListNode(num % 10)
            cur.next = node
            cur = node
            l1cur = l1cur?.next
        }
        while l2cur != nil {
            let num = l2cur!.val + tmp
            tmp = (num / 10)
            let node = ListNode(num % 10)
            cur.next = node
            cur = node
            l2cur = l2cur?.next
        }
        if tmp > 0 {
            let node = ListNode(tmp % 10)
            cur.next = node
        }
        return hair.next
    }
    
    func reverse(_ l: ListNode?) -> ListNode? {
        if l != nil {
            var pre: ListNode? = nil
            var cur = l
            while cur != nil {
                let next = cur?.next
                cur?.next = pre
                pre = cur
                cur = next
            }
            return pre
        }
        return nil
    }
}
