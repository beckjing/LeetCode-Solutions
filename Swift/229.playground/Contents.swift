import UIKit

class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        let nCount = nums.count / 3
        var dic = Dictionary<Int, Int>()
        var result = Set<Int>()
        for num in nums {
            if dic[num] == nil {
                dic[num] = 0
            }
            dic[num]! += 1
            if dic[num]! > nCount {
                result.insert(num)
            }
        }
        return Array<Int>(result)
    }
}
