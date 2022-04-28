import UIKit

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        var result = [[Int]]()
        if root != nil {
            var level = [Node]()
            level.append(root!)
            while level.count > 0 {
                var tmp = [Node]()
                var levelR = [Int]()
                for node in level {
                    levelR.append(node.val)
                    for child in node.children {
                        tmp.append(child)
                    }
                }
                level = tmp
                result.append(levelR)
            }
        }
        return result
    }
}
