import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        var result = Array<ListNode?>()
        var preArr = Array<ListNode?>()
        for _ in 0...k {
            result.append(head)
        }
        preArr = result
        while result[k] != nil {
            var remain = 0
            for _ in 1...k {
                if result[k] != nil {
                    remain += 1
                }
                result[k] = result[k]?.next
            }
            for i in 1..<k {
                if remain == 0 {
                    break
                }
                for j in i..<k {
                    preArr[j] = result[j]
                    result[j] = result[j]?.next
                }
                remain -= 1
            }
        }
        for i in 1..<preArr.count - 1 {
            preArr[i]?.next = nil
        }
        result.popLast()
        return result
    }
}
