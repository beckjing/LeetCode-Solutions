import UIKit

class Solution {
    func countGoodRectangles(_ rectangles: [[Int]]) -> Int {
        var maxLen = 0
        var count = 0
        for rectangle in rectangles {
            let mL = min(rectangle.first!, rectangle.last!)
            if mL > maxLen {
                maxLen = mL
                count = 1
            }
            else if mL == maxLen {
                count += 1
            }
        }
        return count
    }
}
