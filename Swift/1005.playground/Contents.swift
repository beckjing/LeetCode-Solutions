import UIKit

class Solution {
    
    func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
        var sortedN = nums.sorted()
        let nCount = nums.count
        var index = 0
        var remain = k
        while remain > 0 && index < nCount {
            if sortedN[index] < 0 {
                sortedN[index] = -sortedN[index]
                remain -= 1
            }
            else {
                break
            }
            index += 1
        }
        if remain > 0 {
            sortedN.sort()
            if remain % 2 == 1 {
                sortedN[0] = -sortedN[0]
            }
        }
        var result = 0
        for num in sortedN {
            result += num
        }
        return result
    }
    
}
