import UIKit

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var result = Array<Int>.init(repeating: 0, count: triangle.count + 1)
        for i in (0..<triangle.count).reversed() {
            for j in 0...i {
                result[j] = min(result[j], result[j + 1]) + triangle[i][j]
            }
            
        }
        return result[0]
    }
}

print(Solution().minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]]))
