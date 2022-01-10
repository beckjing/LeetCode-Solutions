import UIKit

class ListNode {
    var pre: ListNode?
    var next: ListNode?
    var val: Int?
    init(val: Int?) {
        self.val = val
    }
}

class Dequeue {
    
    let head = ListNode(val: nil)
    var tail = ListNode(val: nil)
    init () {
        self.head.next = self.tail
        self.tail.pre  = self.head
    }
    
    func append(val: Int) {
        let node = ListNode(val: val)
        let pre = self.tail.pre!
        pre.next = node
        node.pre = pre
        node.next = self.tail
        self.tail.pre = node
    }
    
    func popFirst() {
        if self.head.next !== self.tail {
            let next = self.head.next!
            self.head.next = next.next
            next.next?.pre = self.head
        }
    }
    
    func popLast() {
        if self.tail.pre !== self.head {
            let pre = self.tail.pre!
            pre.next = nil
            tail = pre
        }
    }
    
    func last() -> Int? {
        return self.tail.pre!.val
    }
    
    func first() -> Int? {
        return self.head.next!.val
    }
    
}

class Solution {
    
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let nCount = nums.count
        var result = [Int]()
        if nCount == 0 {
            return result
        }
        let dequeue = Dequeue()
        for i in 0..<k {
            while dequeue.last() != nil && nums[dequeue.last()!] < nums[i] {
                dequeue.popLast()
            }
            dequeue.append(val: i)
        }
        result.append(nums[dequeue.first()!])
        for i in k..<nCount {
            let left = i - k + 1
            while dequeue.last() != nil && nums[dequeue.last()!] < nums[i] {
                dequeue.popLast()
            }
            dequeue.append(val: i)
            while dequeue.last() != nil && dequeue.first()! < left {
                dequeue.popFirst()
            }
            result.append(nums[dequeue.first()!])
        }
        return result
    }
}

print(Solution().maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
