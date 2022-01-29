import UIKit

class Solution {
    
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        if nums.count <= 2 {
            return 0
        }
        var result = 0
        var start = 0
        var end = 2
        let nCount = nums.count
        while end < nCount {
            if nums[start + 1] - nums[start] == nums[end] - nums[end - 1] {
                end += 1
            }
            else {
                if end - start >= 3 {
                    let point = end - start - 2
                    var tmp = 0
                    for i in 1...point {
                        tmp += point - i + 1
                    }
                    result += tmp
                }
                start = end - 1
                end = start + 2
            }
        }
        if end == nCount {
            if end - start >= 3 {
                let point = end - start - 2
                var tmp = 0
                for i in 1...point {
                    tmp += point - i + 1
                }
                result += tmp
            }
        }
        return result
    }
    
}

Solution().numberOfArithmeticSlices([1,2,3,4])
