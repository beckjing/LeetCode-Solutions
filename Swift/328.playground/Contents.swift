import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        let single = ListNode()
        let double = ListNode()
        single.next = head
        double.next = head?.next
        var sPos = single.next
        var dPos = double.next
        var sFlag = true
        var pos = head?.next?.next
        while pos != nil {
            if sFlag {
                sPos?.next = pos
                sPos = pos
            }
            else {
                dPos?.next = pos
                dPos = pos
            }
            sFlag = !sFlag
            pos = pos?.next
        }
        sPos?.next = double.next
        dPos?.next = nil
        return single.next
    }
}
