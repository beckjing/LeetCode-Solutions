import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Codec {
    
    func serialize(_ root: TreeNode?) -> String {
        var result = ""
        if root != nil {
            var stk = Array<TreeNode?>()
            stk.append(root)
            while stk.count > 0 {
                var tmp = Array<TreeNode?>()
                for node in stk {
                    if node != nil {
                        result += "\(node!.val)"
                        tmp.append(node?.left)
                        tmp.append(node?.right)
                    }
                    else {
                        result += "N"
                    }
                    result += ","
                }
                stk = tmp
            }
        }
        return result
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        if data.count > 0 {
            let dArr = data.split(separator: ",")
            let dCount = dArr.count
            let root = TreeNode(0)
            var stk = Array<TreeNode>()
            stk.append(root)
            root.val = Int(String(dArr.first!))!
            var index = 1
            while stk.last != nil {
                var tmp = Array<TreeNode>()
                for node in stk {
                    if index < dCount && dArr[index] != "N" {
                        node.left = TreeNode(Int(String(dArr[index]))!)
                        tmp.append(node.left!)
                    }
                    index += 1
                    if index < dCount && dArr[index] != "N" {
                        node.right = TreeNode(Int(String(dArr[index]))!)
                        tmp.append(node.right!)
                    }
                    index += 1
                }
                stk = tmp
            }
            return root
        }
        return nil
    }
}
