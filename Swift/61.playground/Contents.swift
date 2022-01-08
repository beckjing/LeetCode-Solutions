import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next;
        
    }
}

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k == 0 || head == nil {
            return head
        }
        var posK = head!
        var count = 0
        var end: ListNode?
        for i in 1...k {
            if posK.next != nil {
                posK = posK.next!
            }
            else {
                posK.next = head
                posK = posK.next!
                end = posK
                count = i + 1
            }
        }
        if count == 0 {
            var start = head!
            while posK.next != nil {
                start = start.next!
                posK = posK.next!
            }
            let result = start.next
            start.next = nil
            posK.next = head
            return result
        }
        else {
            var start = head!
            while posK.next !== end {
                start = start.next!
                posK = posK.next!
            }
            let result = start.next
            start.next = nil
            return result
        }
    }
}
