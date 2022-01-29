import UIKit

class Solution {
    
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var preDic = Dictionary<Int, Int>()
        preDic[0] = 1
        var pre = 0
        var count = 0
        for num in nums {
            pre += num
            if preDic[pre - k] != nil {
                count += preDic[pre - k]!
            }
            if preDic[pre] == nil {
                preDic[pre] = 0
            }
            preDic[pre]! += 1
        }
        
        return count
    }
    
}

Solution().subarraySum([1,1,1], 2)
