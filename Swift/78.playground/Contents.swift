import Cocoa

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        for num in nums {
            if result.count == 0 {
                result.append([Int]())
                result.append([num])
            }
            else {
                for res in result {
                    var newRes = [Int]()
                    newRes.append(contentsOf: res)
                    newRes.append(num)
                    result.append(newRes)
                }
            }
        }
        return result
    }
}

print(Solution().subsets([1,2,3]))
