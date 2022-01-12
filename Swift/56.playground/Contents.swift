import Cocoa

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let nCount = intervals.count
        if nCount <= 1 {
            return intervals
        }
        var result = [[Int]]()
        let sorted = intervals.sorted { left, right in
            return left.first! < right.first!
        }
        var sLeft = sorted.first!.first!
        var sRight = sorted.first!.last!
        for item in sorted {
            if item.first! <= sRight {
                sRight = max(item.last!, sRight)
            }
            else {
                result.append([sLeft, sRight])
                sLeft = item.first!
                sRight = item.last!
            }
        }
        if result.last == nil || result.last!.last! != sRight {
            result.append([sLeft, sRight])
        }
        return result
    }
}


Solution().merge([[1,4], [4,5]])
