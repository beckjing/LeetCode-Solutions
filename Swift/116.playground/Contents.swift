import UIKit

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}


class Solution {
    func connect(_ root: Node?) -> Node? {
        root?.next = nil
        connect(root?.left, root?.right)
        return root
    }
    
    func connect(_ left: Node?, _ right: Node?) {
        if left == nil || right == nil {
            return
        }
        left?.next = right
        right?.next = nil
        connect(left?.left, left?.right)
        connect(left?.right, right?.left)
        connect(right?.left, right?.right)
    }
}
