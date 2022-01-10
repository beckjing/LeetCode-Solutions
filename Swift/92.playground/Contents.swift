import Cocoa


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    func printList() {
        var current: ListNode? = self
        while current != nil {
            print(current?.val)
            current = current?.next
        }
    }
}

class Solution {
    
    func reverse(head: ListNode?, count: Int) -> ListNode? {
        var pre: ListNode?
        var cur = head
        var times = 0
        while cur != nil && times < count {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
            times += 1
        }
        return pre
    }
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == right {
            return head
        }
        var rightAfter = head
        for _ in 1...right {
            rightAfter = rightAfter?.next
        }
        if left == 1 {
            let result = reverse(head: head, count: right - left + 1)
            head?.next = rightAfter
            return result
        }
        else {
            var leftNode = head
            var leftPre = head
            for _ in 2...left {
                leftPre = leftNode
                leftNode = leftNode?.next
            }
            let result = reverse(head: leftNode, count: right - left + 1)
            leftPre?.next = result
            leftNode?.next = rightAfter
            return head
        }
    }
}

var node5 = ListNode(5)
var node4 = ListNode(4, node5)
var node3 = ListNode(3, node4)
var node2 = ListNode(2, node3)
var node1 = ListNode(1, node2)

Solution().reverseBetween(node1, 2, 4)?.printList()
