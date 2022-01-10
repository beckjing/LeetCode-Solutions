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
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        var posA = headA
        var posB = headB
        while posA !== posB && posA != nil {
            if posA?.next === posB?.next {
                return posA?.next
            }
            if posA?.next != nil {
                posA = posA?.next
            }
            else {
                posA = headB
            }
            if posB?.next != nil {
                posB = posB?.next
            }
            else {
                posB = headA
            }
        }
        return posA
    }
}
