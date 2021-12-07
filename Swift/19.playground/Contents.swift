import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var lastNode = head
        for _ in 1..<n {
            lastNode = lastNode?.next
        }
        var last_n_node = head
        var pre_node = last_n_node
        var pre_index = 0
        while lastNode?.next != nil {
            pre_node = last_n_node
            pre_index += 1
            last_n_node = lastNode?.next
            lastNode = lastNode?.next
        }
        if pre_index == 0 {
            return head?.next
        }
        else {
            pre_node?.next = last_n_node?.next
        }
        return head
    }
}
