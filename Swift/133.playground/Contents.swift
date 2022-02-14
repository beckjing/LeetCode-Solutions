import UIKit

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

class Solution {
    
    var cloneDic = Dictionary<Int, Node>()
    
    func cloneGraph(_ node: Node?) -> Node? {
        if node == nil {
            return nil
        }
        if cloneDic[node!.val] != nil {
            return cloneDic[node!.val]
        }
        let root = Node(node!.val)
        cloneDic[node!.val] = root
        if node!.neighbors.count > 0 {
            for nei in node!.neighbors {
                let cN = cloneGraph(nei)
                if cN != nil {
                    root.neighbors.append(cN)
                }
            }
        }
        return root
    }
}
