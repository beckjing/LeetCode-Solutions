import UIKit

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        let nCount = nums.count
        var result = [Int]()
        var mark = [Bool](repeating: false, count: nCount)
        for i in 0..<nCount {
            mark[nums[i] - 1] = true
        }
        for i in 0..<nCount {
            if mark[i] == false {
                result.append(i + 1)
            }
        }
        return result
    }
}
