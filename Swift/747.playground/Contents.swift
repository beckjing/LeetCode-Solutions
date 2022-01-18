import Cocoa

class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        let nCount = nums.count
        if nCount > 1 {
            var first = 0
            var second = 1
            if nums[1] > nums[0] {
                first = 1
                second = 0
            }
            for i in 2..<nCount {
                if nums[i] > nums[first] {
                    second = first
                    first = i
                }
                else if nums[i] > nums[second] {
                    second = i
                }
            }
            if nums[first] >= nums[second] * 2 {
                return first
            }
        }
        else if nCount == 1 {
            return 0
        }
        return -1
    }
}

print(Solution().dominantIndex([3,6,1,0]))
