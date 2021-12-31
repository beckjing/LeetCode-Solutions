import UIKit

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result = self.fourSum(nums, target, level: 3)
        var resultSet = Set<Array<Int>>()
        for res in result {
            resultSet.insert(res.sorted())
        }
        var sortResult = [[Int]]()
        for res in resultSet {
            sortResult.append(res)
        }
        return sortResult
    }
    
    func fourSum(_ nums: [Int], _ target: Int, level: Int) -> [[Int]] {
        var result = [[Int]]()
        let numsCount = nums.count
        if level == 0 {
            for num in nums {
                if num == target {
                    result.append([num])
                    return result
                }
            }
            return result
        }
        for i in 0..<numsCount {
            var subNums = nums
            let subNum = nums[i]
            subNums.remove(at: i)
            let subRes = self.fourSum(subNums, target - subNum, level: (level - 1))
            if subRes.count > 0 {
                for subre in subRes {
                    var subResult = subre
                    subResult.append(subNum)
                    result.append(subResult)
                }
            }
        }
        return result
    }
}
