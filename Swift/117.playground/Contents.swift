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
        if root != nil {
            var arr = [Node]()
            if root!.left != nil {
                arr.append(root!.left!)
            }
            if root!.right != nil {
                arr.append(root!.right!)
            }
            connect_inner(arr)
        }
        return root
    }
    
    func connect_inner(_ arrPre: [Node]) {
        if arrPre.count > 0 {
            for i in 1..<arrPre.count {
                arrPre[i - 1].next = arrPre[i]
            }
            var arr = [Node]()
            for node in arrPre {
                if node.left != nil {
                    arr.append(node.left!)
                }
                if node.right != nil {
                    arr.append(node.right!)
                }
            }
            if arr.count > 0 {
                connect_inner(arr)
            }
        }
        
    }
}
