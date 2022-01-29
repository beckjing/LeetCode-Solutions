import UIKit

public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

class Solution {
    
    var dic = Dictionary<Int, Array<Node>>()
    
    func findCopyNode(_ node: Node) -> Node {
        let nodes = self.dic[node.val]
        if nodes != nil {
            for i in 0..<nodes!.count {
                if nodes![i] === node {
                    return nodes![i + 1]
                }
            }
        }
        else {
            self.dic[node.val] = [Node]()
        }
        let copyNode = Node(node.val)
        self.dic[node.val]!.append(contentsOf: [node, copyNode])
        if node.next != nil {
            copyNode.next = findCopyNode(node.next!)
        }
        if node.random != nil {
            copyNode.random = findCopyNode(node.random!)
        }
        return copyNode
    }
    
    func copyRandomList(_ head: Node?) -> Node? {
        if head != nil {
            let copyNode = findCopyNode(head!)
            return copyNode
        }
        return nil
        
    }
    
}
