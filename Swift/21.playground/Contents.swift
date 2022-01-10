import Cocoa

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let hair = ListNode(0, nil)
        var current = hair
        var current1 = list1
        var current2 = list2
        while current1 != nil && current2 != nil {
            if current1!.val < current2!.val {
                current.next = current1
                current = current1!
                current1 = current1!.next
            }
            else {
                current.next = current2
                current = current2!
                current2 = current2!.next
            }
        }
        if current1 != nil {
            current.next = current1
        }
        if current2 != nil {
            current.next = current2
        }
        return hair.next
    }
}
