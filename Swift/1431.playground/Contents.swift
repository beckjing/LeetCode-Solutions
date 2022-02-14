import UIKit

class Solution {
    
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let cCount = candies.count
        var result = [Bool](repeating: false, count: cCount)
        var cMax = 0
        for candy in candies {
            cMax = max(cMax, candy)
        }
        var index = 0
        while index < cCount {
            if extraCandies + candies[index] >= cMax {
                result[index] = true
            }
            index += 1
        }
        return result
    }
    
}
