import Cocoa

class Solution {
    
    func combinationSum2_inner(_ candidates: [Int], _ target: Int, _ idx: Int) -> [[Int]] {
        var result = [[Int]]()
        var index = idx
        while index < candidates.count && candidates[index] <= target {
            let item = candidates[index]
            if item == target {
                result.append([item])
                break
            }
            let newRes = combinationSum2_inner(candidates, target - item, index + 1)
            if newRes.count > 0 {
                for res in newRes {
                    var resT = res
                    resT.insert(item, at: 0)
                    result.append(resT)
                }
            }
            while index + 1 < candidates.count && item == candidates[index + 1] {
                index += 1
            }
            index += 1
        }
        return result
    }
    
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        return self.combinationSum2_inner(candidates.sorted(), target, 0)
    }
}

print(Solution().combinationSum2([10,1,2,7,6,1,5], 8))
