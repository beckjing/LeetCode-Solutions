import Cocoa

class Solution {
    func permuteUnique_inner(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let nCount = nums.count
        var index = 0
        while index < nCount {
            let item = nums[index]
            let tmp = [item]
            while index + 1 < nCount && nums[index + 1] == item {
                index += 1
            }
            var subNums = nums
            subNums.remove(at: index)
            let res = permuteUnique_inner(subNums)
            if res.count > 0 {
                for re in res {
                    var reC = [Int]()
                    reC.append(contentsOf: tmp)
                    reC.append(contentsOf: re)
                    result.append(reC)
                }
            }
            else {
                result.append(tmp)
            }
            index += 1
        }
        return result
    }
    
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        return permuteUnique_inner(nums.sorted())
    }
}

print(Solution().permuteUnique([1,1,2]))
