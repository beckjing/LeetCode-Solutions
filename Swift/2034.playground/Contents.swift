import UIKit

public class Node {
    
    var price: Int?
    var timestamp: Int?
    var pre: Node?
    var next: Node?
    
    init(_ timestamp: Int, _ price: Int) {
        self.timestamp = timestamp
        self.price = price
    }
    
}

class StockPrice {
    
    var nodeDic = Dictionary<Int, Node>()
    var nodeArr = Array<Node>()
    var timeBigNode: Node?
    
    init() {
        
    }
    
    func update(_ timestamp: Int, _ price: Int) {
        if nodeDic[timestamp] == nil {
            nodeDic[timestamp] = Node(timestamp, price)
            self.insert(nodeDic[timestamp]!)
        }
        else {
            self.delete(nodeDic[timestamp]!)
            nodeDic[timestamp]!.price = price
            self.insert(nodeDic[timestamp]!)
        }
        if self.timeBigNode == nil || self.timeBigNode!.timestamp! < timestamp {
            self.timeBigNode = nodeDic[timestamp]
        }
    }
    
    func insert(_ node: Node) {
        let nCount = self.nodeArr.count
        var start = 0
        var end = nCount - 1
        while start <= end {
            let middle = start + (end - start) / 2
            if self.nodeArr[middle].price! > node.price! {
                end = middle - 1
            }
            else if self.nodeArr[middle].price! < node.price! {
                start = middle + 1
            }
            else {
                end -= 1
            }
        }
        self.nodeArr.insert(node, at: start)
    }
    
    func delete(_ node: Node) {
        let nCount = self.nodeArr.count
        var start = 0
        var end = nCount - 1
        while start < end {
            let middle = start + (end - start) / 2
            if self.nodeArr[middle].price! > node.price! {
                end = middle
            }
            else if self.nodeArr[middle].price! < node.price! {
                start = middle + 1
            }
            else {
                if self.nodeArr[end].timestamp != node.timestamp {
                    end -= 1
                }
                else {
                    start = end
                }
            }
        }
        self.nodeArr.remove(at: start)
    }
    
    func current() -> Int {
        return self.timeBigNode!.price!
    }
    
    func maximum() -> Int {
        return self.nodeArr.last!.price!
    }
    
    func minimum() -> Int {
        return self.nodeArr.first!.price!
    }
}
