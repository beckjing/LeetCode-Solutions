import UIKit

class Solution {
    
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        let sortedN: [Int] = nums.sorted().reversed()
        let sCount = sortedN.count
        var nDic = Dictionary<Int, Int>()
        var index = 0
        while index < sCount {
            if index < sCount - 1 && sortedN[index] == sortedN[index + 1] {
            }
            else {
                nDic[sortedN[index]] = sCount - index - 1
            }
            index += 1
        }
        var result = [Int]()
        for num in nums {
            result.append(nDic[num]!)
        }
        return result
    }
}

Solution().smallerNumbersThanCurrent([1, 1, 7])
