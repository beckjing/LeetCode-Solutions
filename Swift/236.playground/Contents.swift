import Cocoa


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

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        let pPath = self.findPath(root, p)
        let qPath = self.findPath(root, q)
        var index = 0
        var result: TreeNode?
        while pPath[index] === qPath[index] {
            result = pPath[index]
            if index < pPath.count - 1 && index < qPath.count - 1 {
                index += 1
            }
            else {
                break
            }
        }
        return result
    }
    
    func findPath(_ root: TreeNode?, _ end: TreeNode?) -> Array<TreeNode> {
        var result = Array<TreeNode>()
        if root != nil && root?.val == end?.val {
            result.append(root!)
        }
        else if root != nil {
            var leftRes = self.findPath(root?.left, end)
            var rightRes = self.findPath(root?.right, end)
            if leftRes.count > 0 {
                leftRes.insert(root!, at: 0)
                return leftRes
            }
            else if rightRes.count > 0 {
                rightRes.insert(root!, at: 0)
                return rightRes
            }
        }
        return result
    }
}


//[3,5,1,6,2,0,8,null,null,7,4]

let node0 = TreeNode(0)
let node1 = TreeNode(1)
let node2 = TreeNode(2)
let node3 = TreeNode(3)
let node4 = TreeNode(4)
let node5 = TreeNode(5)
let node6 = TreeNode(6)
let node7 = TreeNode(7)
let node8 = TreeNode(8)

node2.left = node7
node2.right = node4
node5.left = node6
node5.right = node2
node1.left = node0
node1.right = node8
node3.left = node5
node3.right = node1

//node2.left = node1

print(Solution().lowestCommonAncestor(node3, node2, node1)?.val)
