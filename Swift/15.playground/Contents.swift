import Cocoa

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let numsSorted = nums.sorted()
        let numsCount = nums.count
        var result = [[Int]]()
        for first in 0..<numsCount {
            if first > 0 && numsSorted[first] == numsSorted[first - 1] {
                continue
            }
            var third = numsCount - 1
            let target = -numsSorted[first]
            for second in (first + 1)..<numsCount {
                if second > first + 1 && numsSorted[second] == numsSorted[second - 1] {
                    continue
                }
                while second < third && numsSorted[second] + numsSorted[third] > target {
                    third -= 1
                }
                if second == third {
                    break
                }
                if numsSorted[second] + numsSorted[third] == target {
                    result.append([numsSorted[first], numsSorted[second], numsSorted[third]])
                }
            }
        }
        return result
    }
}
