import UIKit

class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let sortedP = points.sorted { a, b in
            return a[1] < b[1]
        }
        var result = 0
        var startY = sortedP.first![1]
        for point in sortedP {
            if point[0] > startY {
                startY = point[1]
                result += 1
            }
        }
        return result
    }
}
