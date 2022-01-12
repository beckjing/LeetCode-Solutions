import Cocoa

class Solution {
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var result = Set<Int>()
        for num in nums {
            if result.contains(num) {
                return num
            }
            result.insert(num)
        }
        return -1
    }
}
