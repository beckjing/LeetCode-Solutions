import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        var singleNode = head
        var doubleNode = head?.next
        while doubleNode != nil {
            singleNode = singleNode?.next
            doubleNode = doubleNode?.next?.next
        }
        return singleNode
    }
}
