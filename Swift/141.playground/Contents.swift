import UIKit


 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var pos1 = head
        var pos2 = head?.next?.next
        if pos1 === pos2 && pos1 != nil {
            return true
        }
        while pos1 !== pos2 {
            pos1 = pos1?.next
            pos2 = pos2?.next?.next
            if pos1 === pos2 && pos1 != nil {
                return true
            }
        }
        return false
    }
}
