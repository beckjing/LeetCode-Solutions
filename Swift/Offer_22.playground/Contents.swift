import Cocoa

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var end = head
        for _ in 1..<k {
            end = end?.next
        }
        var result = head
        while end != nil {
            result = result?.next
            end = end?.next
        }
        return result
    }
}
