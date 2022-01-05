import Cocoa

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        var travel = [TreeNode]()
        if root != nil {
            var dir = false
            travel.append(root!)
            while travel.count > 0 {
                var line = [Int]()
                var tmp = [TreeNode]()
                for node in travel {
                    line.append(node.val)
                }
                if dir {
                    for node in travel.reversed() {
                        if node.left != nil {
                            tmp.append(node.left!)
                        }
                        if node.right != nil {
                            tmp.append(node.right!)
                        }
                    }
                    dir = !dir
                }
                else {
                    for node in travel.reversed() {
                        if node.right != nil {
                            tmp.append(node.right!)
                        }
                        if node.left != nil {
                            tmp.append(node.left!)
                        }
                    }
                    dir = !dir
                }
                travel = tmp
                result.append(line)
            }
        }
        return result
    }
}
