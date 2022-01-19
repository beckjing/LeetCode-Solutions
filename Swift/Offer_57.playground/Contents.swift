import UIKit

class Solution {
    func findContinuousSequence(_ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var left = 1
        var right = 2
        while left < right {
            let sum = (left + right) * (right - left + 1) / 2
            if sum == target {
                var tmp = [Int]()
                for i in left...right {
                    tmp.append(i)
                }
                result.append(tmp)
                left += 1
            }
            else if sum < target {
                right += 1
            }
            else {
                left += 1
            }
        }
        return result
    }
}
