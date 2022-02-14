import UIKit

public class Node {
    public var val: Int
    public var prev: Node?
    public var next: Node?
    public var child: Node?
    public init(_ val: Int) {
        self.val = val
        self.prev = nil
        self.next = nil
        self.child  = nil
    }
}

class Solution {
    
    func flatten(_ head: Node?) -> Node? {
        var cur = head
        while cur != nil {
            if cur!.child != nil {
                let newNext = flatten(cur!.child)!
                let oldNext = cur!.next
                cur!.child = nil
                cur!.next = newNext
                newNext.prev = cur
                cur = append(newNext, oldNext)
            }
            else {
                cur = cur!.next
            }
        }
        return head
    }
    
    
    func append(_ head: Node, _ next: Node?) -> Node? {
        if next != nil {
            var cur: Node? = head
            var pre: Node? = nil
            while cur != nil {
                pre = cur
                cur = cur?.next
            }
            pre?.next = next
            next?.prev = pre
            return next
        }
        return nil
    }
}
