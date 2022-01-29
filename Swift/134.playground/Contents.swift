import UIKit

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let gCount = gas.count
        let cCount = cost.count
        if gCount != cCount || gCount == 0 {
            return -1
        }
        var start = 0
        var end = 0
        var tmp = 0
        while start < cCount {
            tmp += gas[end] - cost[end]
            print(start, end)
            if tmp < 0 {
                if start > end {
                    return -1
                }
                start = end + 1
                end = end + 1
                tmp = 0
            }
            else {
                end = (end + 1) % cCount
                if end == start {
                    return start
                }
            }
        }
        return -1
    }
}

Solution().canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2])
