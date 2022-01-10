import UIKit

public class ListNode {
    public var count: Int
    public var next: ListNode?
    public var pre: ListNode?
    public var set = Set<String>()
    init(_ count: Int) {
        self.count = count
    }
}

class AllOne {
    
    var keyMap = Dictionary<String, Int>()
    var valueMap = Dictionary<Int, ListNode>()
    var maxNode = ListNode(Int.max)
    var minNode = ListNode(-1)
    
    init() {
        maxNode.pre = minNode
        minNode.next = maxNode
        valueMap[-1] = minNode
        valueMap[Int.max] = maxNode
    }
    
    func inc(_ key: String) {
        var count = 1
        if keyMap[key] != nil {
            count = keyMap[key]! + 1
        }
        keyMap[key] = count
        if valueMap[count] == nil {
            valueMap[count] = ListNode(count)
        }
        if count == 1 {//新key
            let minNext = self.minNode.next!
            if minNext.count != 1 {
                self.minNode.next = valueMap[count]!
                valueMap[count]!.pre = self.minNode
                valueMap[count]!.next = minNext
                minNext.pre = valueMap[count]!
            }
        }
        else {//key 从 count - 1 -> count
            let count1Node = valueMap[count - 1]!
            count1Node.set.remove(key)
            if count1Node.next!.count != count {
                let count1Next = count1Node.next!
                count1Next.pre = valueMap[count]!
                valueMap[count]!.next = count1Next
                valueMap[count]!.pre = count1Node
                count1Node.next = valueMap[count]!
            }
            if count1Node.set.count == 0 {
                valueMap.removeValue(forKey: count - 1)
                let count1pre = count1Node.pre!
                count1pre.next = valueMap[count]
                valueMap[count]!.pre = count1pre
            }
        }
        valueMap[count]!.set.insert(key)
    }
    
    func dec(_ key: String) {
        let count = keyMap[key]! - 1
        let count1Node = valueMap[count + 1]!
        count1Node.set.remove(key)
        if count == 0 {//删除一个key
            keyMap.removeValue(forKey: key)
            if count1Node.set.count == 0 {
                self.minNode.next = count1Node.next
                count1Node.next?.pre = self.minNode
                valueMap.removeValue(forKey: count + 1)
            }
        }
        else {//key 从 count <- count + 1
            keyMap[key] = count
            if valueMap[count] == nil {
                valueMap[count] = ListNode(count)
            }
            if count1Node.pre!.count != count {
                let count1pre = count1Node.pre!
                count1pre.next = valueMap[count]!
                valueMap[count]!.pre = count1pre
                valueMap[count]!.next = count1Node
                count1Node.pre = valueMap[count]!
            }
            if count1Node.set.count == 0 {
                valueMap.removeValue(forKey: count + 1)
                let count1next = count1Node.next!
                count1next.pre = valueMap[count]
                valueMap[count]!.next = count1next
            }
            valueMap[count]!.set.insert(key)
        }
    }
    
    func getMaxKey() -> String {
        if self.maxNode.pre !== self.minNode {
            return self.maxNode.pre!.set.first!
        }
        return ""
    }
    
    func getMinKey() -> String {
        if self.minNode.next !== self.maxNode {
            return self.minNode.next!.set.first!
        }
        return ""
    }
}

let allone = AllOne()
allone.inc("hello")
allone.inc("goodbye")
allone.inc("hello")
allone.inc("hello")
//allone.minNode.printList()
print(allone.getMaxKey())

allone.inc("leet")
allone.inc("code")
allone.inc("leet")
allone.dec("hello")

allone.inc("leet")
allone.inc("code")
allone.inc("code")
allone.minNode.printList()
print(allone.getMaxKey())
