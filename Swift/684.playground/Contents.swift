import UIKit

class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let eCount = edges.count
        var setArr = Array(0...eCount)
        for edge in edges {
            var start1 = min(edge.first!, edge.last!)
            var start2 = max(edge.first!, edge.last!)
            while setArr[start1] != start1 {
                start1 = setArr[start1]
            }
            while setArr[start2] != start2 {
                start2 = setArr[start2]
            }
            if start1 == start2 {
                return edge
            }
            else {
                setArr[start1] = start2
            }
        }
        return [Int]()
    }
}

print(Solution().findRedundantConnection([[21,22],[4,7],[12,13],[13,25],[12,15],[17,23],[15,16],[8,21],[23,24],[3,9],[19,21],[13,21],[4,10],[5,6],[1,20],[10,16],[1,4],[10,14],[5,20],[1,2],[3,24],[2,11],[11,24],[24,25],[17,18]]))
