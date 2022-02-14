import UIKit

class Solution {
    func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
        var result = [Int](repeating: 0, count: num_people)
        var index = 0
        var remain = candies
        var cur = 1
        while remain > 0 {
            if remain > cur {
                result[index] += cur
            }
            else {
                result[index] += remain
            }
            remain -= cur
            index = cur % num_people
            cur += 1
        }
        return result
    }
}

Solution().distributeCandies(10, 3)
