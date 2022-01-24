import UIKit

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var result = 0
        let nSet = Set<Int>(nums)
        for num in nums {
            if nSet.contains(num - 1) == false {
                var start = num
                while nSet.contains(start) {
                    start += 1
                }
                if start - num > result {
                    result = start - num
                }
            }
        }
        return result
    }
}
