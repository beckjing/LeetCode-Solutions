import Cocoa

class Solution {
    func combinationSum(_ candidates: [Int], _ idx: Int, _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var idxC = idx
        while idxC < candidates.count && candidates[idxC] <= target {
            let item = candidates[idxC]
            if item == target {
                result.append([item])
                break
            }
            else {
                let itemResult = combinationSum(candidates, idxC, target - item)
                if itemResult.count > 0 {
                    for itemRes in itemResult {
                        var res = [Int]()
                        res.append(item)
                        res.append(contentsOf: itemRes)
                        result.append(res)
                    }
                }
                idxC += 1
            }
        }
        return result
    }
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        return combinationSum(candidates.sorted(), 0, target)
    }
}

print(Solution().combinationSum([2,3,5], 8))
