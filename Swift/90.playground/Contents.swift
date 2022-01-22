import UIKit

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        return subsetsWithDup_inner(nums.sorted())
    }
    
    func subsetsWithDup_inner(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        result.append([Int]())
        if nums.count > 1 {
            var index = 0
            while index < nums.count {
                if index > 0 {
                    if nums[index] == nums[index - 1] {
                        index += 1
                        continue
                    }
                }
                let subRes = subsetsWithDup_inner(Array(nums[index + 1..<nums.count]))
                for subRe in subRes {
                    var res = [Int]()
                    res.append(nums[index])
                    res.append(contentsOf: subRe)
                    result.append(res)
                }
                index += 1
            }
        }
        else if nums.count == 1 {
            result.append(nums)
        }
        return result
    }
}

Solution().subsetsWithDup([1,2])
