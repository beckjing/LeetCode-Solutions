import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var header: ListNode? = nil
        var pos: ListNode? = nil
        var listC = lists
        while listC.count != 0 {
            let listCount = lists.count
            var minValue = Int.max
            var minIndex = -1
            for i in 0..<listCount {
                if listC[i] != nil && listC[i]!.val < minValue {
                    minValue = listC[i]!.val
                    minIndex = i
                }
            }
            if minIndex >= 0 {
                if header == nil {
                    header = listC[minIndex]
                    pos = header
                }
                else {
                    pos?.next = listC[minIndex]
                    pos = pos?.next
                }
                listC[minIndex] = listC[minIndex]!.next
            }
            else {
                break
            }
        }
        return header
    }
}
