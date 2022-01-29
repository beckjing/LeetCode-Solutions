import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let hair = ListNode(Int.min)
        var pre = head
        var next = head
        while pre != nil {
            next = next!.next
            insertionSortList_inner(hair, node: pre!)
            pre = next
            print(pre?.val)
        }
        return hair.next
    }
    
    func insertionSortList_inner(_ hair: ListNode, node: ListNode)  {
        if hair.next == nil {
            hair.next = node
        }
        else {
            var pre = hair
            var cur = hair.next
            while cur != nil && cur!.val < node.val {
                pre = cur!
                cur = cur!.next
            }
            print(pre.val, node.val)
            let preNext = pre.next
            pre.next = node
            node.next = preNext
        }
    }
}
