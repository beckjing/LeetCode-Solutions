import Cocoa

class Solution {
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var start = 0
        var end = 0
        let nCount = nums.count
        while end < nCount {
            if nums[start] != val {
                start += 1
                end += 1
            }
            else {
                if nums[end] == val {
                    end += 1
                }
                else {
                    nums.swapAt(start, end)
                }
            }
        }
        return start + 1
    }
}
