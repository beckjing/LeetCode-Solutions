import Cocoa

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var result = target > 0 ? Int.max : Int.min
        let numsSorted = nums.sorted()
        let nCount = nums.count
        for first in 0...(nCount - 3) {
            if first > 0 && numsSorted[first - 1] == numsSorted[first] {
                continue
            }
            for second in (first + 1)...(nCount - 2) {
                if second > first + 1 && numsSorted[second - 1] == numsSorted[second] {
                    continue
                }
                var third = nCount - 1
                while second < third {
                    if abs(target - numsSorted[first] - numsSorted[second] - numsSorted[third]) < abs(target - result) {
                        result = numsSorted[first] + numsSorted[second] + numsSorted[third]
                    }
                    while second < third && numsSorted[third - 1] == numsSorted[third] {
                        third -= 1
                    }
                    third -= 1
                }
            }
        }
        return result
    }
}

print(Solution().threeSumClosest([1,1,1,1], -100))
