import UIKit

class Solution {
    
    func sortArray(_ nums: [Int]) -> [Int] {
        var numsC = nums
        sortArray_inner(&numsC, 0, nums.count - 1)
        return numsC
    }
    
    func sortArray_inner(_ nums: inout [Int], _ start: Int, _ end: Int) {
        if start >= end {
            return
        }
        let index = partion(&nums, start, end)
        sortArray_inner(&nums, start, index - 1)
        sortArray_inner(&nums, index + 1, end)
    }
    
    func partion(_ nums: inout [Int], _ start: Int, _ end: Int) -> Int {
        var index = start
        let random = Int.random(in: start...end)
        nums.swapAt(random, end)
        let endN = nums[end]
        for i in start...end {
            if nums[i] < endN {
                nums.swapAt(i, index)
                index += 1
            }
        }
        nums.swapAt(index, end)
        return index
    }
}

print(Solution().sortArray([5,1,1,2,0,0]))
