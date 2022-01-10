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
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                var point = head
                while point !== slow {
                    point = point?.next
                    slow = slow?.next
                }
                return point
            }
        }
        return nil
        
    }
}
