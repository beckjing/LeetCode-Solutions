import UIKit


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
    
    func desciption() {
        
    }
}

class Solution {
    
    func generateTrees(_ n: Int) -> [TreeNode?] {
        return generateTrees(Array(1...n))
    }
    
    func generateTrees(_ nArr: [Int]) -> [TreeNode?] {
        var result = [TreeNode]()
        let nCount = nArr.count
        if nCount >= 2 {
            var index = 0
            while index < nCount {
                let value = nArr[index]
                let leftNodes = generateTrees(Array( nArr[0..<index]))
                let rightNodes = generateTrees(Array(nArr[index + 1..<nCount]))
                if leftNodes.count > 0 && rightNodes.count > 0 {
                    for leftNode in leftNodes {
                        for rightNode in rightNodes {
                            let root = TreeNode(value)
                            root.left = leftNode
                            root.right = rightNode
                            result.append(root)
                        }
                    }
                }
                else if rightNodes.count > 0 {
                    for rightNode in rightNodes {
                        let root = TreeNode(value)
                        root.right = rightNode
                        result.append(root)
                    }
                }
                else {
                    for leftNode in leftNodes {
                        let root = TreeNode(value)
                        root.left = leftNode
                        result.append(root)
                    }
                }
                index += 1
            }
        }
        else if nCount > 0 {//
            result.append(TreeNode(nArr.first!))
        }
        return result
    }
}

print(Solution().generateTrees(4))
