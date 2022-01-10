import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        var aBefore = list1
        var bAfter = list1
        for _ in 0...(b-a) {
            bAfter = bAfter?.next
        }
        for _ in 1..<a {
            aBefore = aBefore?.next
            bAfter = bAfter?.next
        }
        var tail2 = list2
        while tail2?.next != nil {
            tail2 = tail2?.next
        }
        aBefore?.next = list2
        tail2?.next = bAfter
        return list1
    }
}
