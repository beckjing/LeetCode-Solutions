import UIKit

class Solution {
    func findCenter(_ edges: [[Int]]) -> Int {
        var dic = Dictionary<Int, Int>()
        var result = -1
        for edge in edges {
            let left = edge.first!
            let right = edge.last!
            if dic[left] == nil {
                dic[left] = 0
            }
            dic[left]! += 1
            if dic[left]! >= 2 {
                return left
            }
            if dic[right] == nil {
                dic[right] = 0
            }
            dic[right]! += 1
            if dic[right]! >= 2 {
                return right
            }
        }
        return result
    }
}
