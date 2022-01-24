import UIKit

class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var rSet = Set<Int>()
        for num in nums {
            rSet.insert(num)
        }
        let numsC = Array<Int>(rSet)
        let nCount = numsC.count
        if nCount < 3 {
            return max(numsC.first!, numsC.last!)
        }
        var result = Array(numsC[0..<3])
        result.sort()
        var index = 3
        while index < nCount {
            if numsC[index] >= result.last! {
                result[0] = result[1]
                result[1] = result[2]
                result[2] = numsC[index]
            }
            else if numsC[index] > result.first! {
                if numsC[index] > result[1] {
                    result[0] = result[1]
                    result[1] = numsC[index]
                }
                else {
                    result[0] = numsC[index]
                }
            }
            index += 1
        }
        return result.first!
    }
}
