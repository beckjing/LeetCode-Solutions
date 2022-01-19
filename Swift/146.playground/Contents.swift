import UIKit

public class TreeNode {
    
    var key: Int?
    var val: Int?
    var next: TreeNode?
    var pre: TreeNode?
    
}


public class Dequeue {
    
    let head = TreeNode()
    let tail = TreeNode()
    var count = 0
    
    init() {
        self.head.next = self.tail
        self.tail.pre = self.head
    }
    
    func insertNode(node: TreeNode) {
        let headNext = self.head.next
        self.head.next = node
        node.pre = self.head
        node.next = headNext
        headNext?.pre = node
        self.count += 1
    }
    
    func deleteNode(node: TreeNode) {
        let nodePre = node.pre
        let nodeNext = node.next
        nodePre?.next = nodeNext
        nodeNext?.pre = nodePre
        node.next = nil
        node.pre = nil
        self.count -= 1
    }
    
    func popLast() -> TreeNode? {
        if self.tail.pre !== self.head {
            let preNode = self.tail.pre!
            self.deleteNode(node: preNode)
            return preNode
        }
        return nil
    }
    
}



class LRUCache {
    
    let dequeue = Dequeue()
    var cacheDic = Dictionary<Int, TreeNode>()
    var capacity = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if self.cacheDic[key] != nil {
            let node = self.cacheDic[key]!
            self.dequeue.deleteNode(node: node)
            self.dequeue.insertNode(node: node)
            return node.val!
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if self.cacheDic[key] == nil {
            let node = TreeNode()
            node.key = key
            node.val = value
            self.cacheDic[key] = node
            self.dequeue.insertNode(node: node)
        }
        else {
            let node = self.cacheDic[key]!
            node.val = value
            self.dequeue.deleteNode(node: node)
            self.dequeue.insertNode(node: node)
        }
        if self.dequeue.count > self.capacity {
            let last = self.dequeue.popLast()!
            self.cacheDic.removeValue(forKey: last.key!)
        }
    }
}

//["LRUCache","put","put","get","put","get","put","get","get","get"]
//[[2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]]
let cache = LRUCache(2)
cache.put(1, 1)
cache.put(2, 2)
cache.get(1)
cache.put(3, 3)
cache.get(2)
