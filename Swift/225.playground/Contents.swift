import Cocoa

class ListNode {
    
    var val: Int?
    var next: ListNode?
    var pre: ListNode?
    init(val: Int?) {
        self.val = val
    }
    
}

class MyStack {
    
    let head = ListNode(val: nil)
    let tail = ListNode(val: nil)
    
    init() {
        self.head.next = self.tail
        self.tail.pre = self.head
    }
    
    func push(_ x: Int) {
        let tail = self.tail.pre!
        tail.next = ListNode(val: x)
        tail.next!.pre = tail
        tail.next!.next = self.tail
        self.tail.pre = tail.next
    }
    
    func pop() -> Int {
        let tail = self.tail.pre!
        tail.pre?.next = self.tail
        self.tail.pre = tail.pre
        tail.pre = nil
        tail.next = nil
        return tail.val!
    }
    
    func top() -> Int {
        return self.tail.pre!.val!
    }
    
    func empty() -> Bool {
        return self.head.next === self.tail
    }
}
