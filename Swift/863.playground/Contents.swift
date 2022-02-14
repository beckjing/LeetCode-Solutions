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

class Solution {
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        var result = [Int]()
        if root == nil || target == nil {
            return result
        }
        result.append(contentsOf: find(target!, k))
        if root !== target {
            let path = findPath(root!, target!)
            let pCount = path.count
            var index = 0
            while index < pCount - 1 {
                let cur = path[index]
                let next = path[index + 1]
                let depth = pCount - index - 1
                if depth < k {
                    if cur.left != nil && cur.left !== next {
                        result.append(contentsOf: find(cur.left!, k - depth - 1))
                    }
                    else if cur.right != nil && cur.right !== next {
                        result.append(contentsOf: find(cur.right!, k - depth - 1))
                    }
                }
                else if depth == k {
                    result.append(cur.val)
                }
                index += 1
            }
        }
        return result
    }
    
    func findPath(_ root: TreeNode, _ target: TreeNode) -> [TreeNode] {
        var result = [TreeNode]()
        if root === target {
            result.append(root)
        }
        else {
            if root.left != nil {
                let path = findPath(root.left!, target)
                if path.count > 0 {
                    result.append(root)
                    result.append(contentsOf: path)
                    return result
                }
            }
            if root.right != nil {
                let path = findPath(root.right!, target)
                if path.count > 0 {
                    result.append(root)
                    result.append(contentsOf: path)
                    return result
                }
            }
        }
        return result
    }
    
    func find(_ root: TreeNode, _ k: Int) -> [Int] {
        var result = [Int]()
        if k < 0 {
            return result
        }
        else if k == 0 {
            result.append(root.val)
        }
        else {
            if root.left != nil {
                result.append(contentsOf: find(root.left!, k - 1))
            }
            if root.right != nil {
                result.append(contentsOf: find(root.right!, k - 1))
            }
        }
        return result
    }
}
