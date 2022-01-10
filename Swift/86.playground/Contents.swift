import Cocoa

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let littleHair = ListNode(0, nil)
        var littleCurrent: ListNode? = littleHair
        let largeHair = ListNode(0, nil)
        var largeCurrent: ListNode? = largeHair
        var pos = head
        while pos !== nil {
            if pos!.val < x {
                littleCurrent?.next = pos
                littleCurrent = pos
            }
            else {
                largeCurrent?.next = pos
                largeCurrent = pos
            }
            pos = pos?.next
        }
        largeCurrent?.next = nil
        littleCurrent?.next = largeHair.next
        return littleHair.next
    }
}

//[1,4,3,2,5,2]
//3
var node6 = ListNode(2, nil)
var node5 = ListNode(5, node6)
var node4 = ListNode(2, node5)
var node3 = ListNode(3, node4)
var node2 = ListNode(4, node3)
var node1 = ListNode(1, node2)

var result = Solution().partition(node1, 3)
