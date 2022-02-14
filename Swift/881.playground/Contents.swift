import UIKit

class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        var result = 0
        let pSorted: [Int] = people.sorted().reversed()
        var start = 0
        var end = pSorted.count - 1
        while start <= end {
            if pSorted[start] + pSorted[end] <= limit {
                start += 1
                end -= 1
            }
            else {
                start += 1
            }
            result += 1
        }
        return result
    }
}

Solution().numRescueBoats([3,5,3,4], 5)
