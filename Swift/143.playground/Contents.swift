import Cocoa

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
    func reorderList(_ head: ListNode?) {
        let startHair = ListNode(0, head)
        let endHair = ListNode(0)
        var slow = head
        var fast = head
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        endHair.next = slow?.next
        slow?.next = nil
        if endHair.next != nil {
            endHair.next = revertList(endHair.next)
            var endNext = endHair.next
            var startNext = startHair.next
            while endNext != nil {
                let tmpStartN = startNext?.next
                let tmpEndN = endNext?.next
                startNext?.next = endNext
                endNext?.next = tmpStartN
                startNext = tmpStartN
                endNext = tmpEndN
            }
        }
        startHair.next = nil
        endHair.next = nil
    }
    
    func revertList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode?
        var cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
}

//var node5 = ListNode(5)
var node4 = ListNode(4)
var node3 = ListNode(3, node4)
var node2 = ListNode(2, node3)
var node1 = ListNode(1, node2)

Solution().reorderList(node1)
