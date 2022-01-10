import Cocoa

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var arr = [Int]()
        var cur = head
        while cur != nil {
            arr.append(cur!.val)
            cur = cur?.next
        }
        let arrCount = arr.count
        for i in 0...arrCount / 2 {
            if arr[i] != arr[arrCount - i - 1] {
                return false
            }
        }
        return true
    }
}
