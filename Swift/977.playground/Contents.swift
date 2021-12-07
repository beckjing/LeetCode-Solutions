import UIKit

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var negIdx = 0
        for i in 0...(nums.count - 1) {
            if nums[i] <= 0 {
                negIdx = i
            }
            else {
                break
            }
        }
        var posIdx = negIdx + 1
        while posIdx < nums.count && negIdx >= 0 {
            if abs(nums[posIdx]) < abs(nums[negIdx]) {
                result.append(nums[posIdx] * nums[posIdx])
                posIdx += 1
            }
            else {
                result.append(nums[negIdx] * nums[negIdx])
                negIdx -= 1
            }
        }
        while posIdx < nums.count {
            result.append(nums[posIdx] * nums[posIdx])
            posIdx += 1
        }
        while negIdx >= 0 {
            result.append(nums[negIdx] * nums[negIdx])
            negIdx -= 1
        }
        
        return result
    }
}

print(Solution().sortedSquares([-4,-1,0,3,10]))
