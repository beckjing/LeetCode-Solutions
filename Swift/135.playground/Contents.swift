import UIKit

class Solution {
    func candy(_ ratings: [Int]) -> Int {
        let rCount = ratings.count
        var left = [Int](repeating: 1, count: rCount)
        var right = [Int](repeating: 1, count: rCount)
        for i in 1..<rCount {
            if ratings[i] > ratings[i - 1] {
                left[i] = left[i - 1] + 1
            }
        }
        for i in 1..<rCount {
            if ratings[rCount - i] < ratings[rCount - i - 1] {
                right[rCount - i - 1] = right[rCount - i] + 1
            }
        }
        var result = 0
        for i in 0..<rCount {
            result += max(left[i], right[i])
        }
        return result
    }
}

print(Solution().candy([1, 0, 2]))
