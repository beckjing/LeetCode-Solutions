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
    func reversePrint(_ head: ListNode?) -> [Int] {
        var result = [Int]()
        var cur = head
        while cur != nil {
            result.append(cur!.val)
            cur = cur!.next
        }
        return result.reversed()
    }
}
