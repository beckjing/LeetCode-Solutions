import UIKit

class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var start = 0
        var end = nums.count - 1
        var result = nums
        while start <= end {
            if result[start] % 2 == 0 {
                start += 1
            }
            else {
                if result[end] % 2 == 1 {
                    end -= 1
                }
                else {
                    let tmp = result[start]
                    result[start] = result[end]
                    result[end] = tmp
                    start += 1
                    end -= 1
                }
            }
        }
        return result
    }
}

print(Solution().sortArrayByParity([3, 1, 2, 4]))
