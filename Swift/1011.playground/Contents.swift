import UIKit

class Solution {
    
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var start = weights.max()!
        var end = 0
        for weight in weights {
            end += weight
        }
        while start < end {
            let middle = start + (end - start) / 2
            let checkDay = checkDays(weights, ship: middle)
            if checkDay <= days {
                end = middle
            }
            else {
                start = middle + 1
            }
        }
        return start
    }
    
    func checkDays(_ weights: [Int], ship: Int) -> Int {
        var result = 0
        var cur = 0
        for weight in weights {
            if cur + weight > ship {
                cur = weight
                result += 1
            }
            else {
                cur += weight
            }
        }
        if cur > 0 {
            result += 1
        }
        return result
    }
}

Solution().shipWithinDays([1,2,3,4,5,6,7,8,9,10], 5)
