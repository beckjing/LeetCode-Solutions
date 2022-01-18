import Cocoa

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
    var head: ListNode?
    var meetEnd: Bool = false
    var length: UInt32 = 0
    var visitNode: ListNode?
    
    init(_ head: ListNode?) {
        self.head = head
        self.visitNode = head
        if self.head != nil {
            self.length = 1
        }
    }
    
    func getRandom() -> Int {
        var random = UInt32.random(in: UInt32.min...UInt32.max)
        var result = self.head
        if self.meetEnd {
            random = random % self.length
        }
        var index = 0
        while random != 0 {
            if index == self.length {
                self.length += 1
            }
            if result?.next != nil {
                result = result?.next
                index += 1
            }
            else {
                self.meetEnd = true
                random = random % self.length
                result = self.head
            }
            random -= 1
        }
        return result!.val
    }
}

