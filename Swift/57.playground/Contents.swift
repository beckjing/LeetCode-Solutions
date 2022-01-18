import Cocoa

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var newStart = newInterval.first!
        var newEnd = newInterval.last!
        var index = 0
        let iCount = intervals.count
        while index < iCount {
            let interval = intervals[index]
            if interval.first! > newEnd {
                result.append([newStart, newEnd])
                break
            }
            else if interval.last! >= newStart {
                newStart = min(newStart, interval.first!)
                newEnd = max(newEnd, interval.last!)
            }
            else if interval.last! < newStart {
                result.append(interval)
            }
            index += 1
        }
        while index < iCount {
            let interval = intervals[index]
            result.append(interval)
            index += 1
        }
        if result.last == nil || result.last!.last! < newEnd {
            result.append([newStart, newEnd])
        }
        return result
    }
}
