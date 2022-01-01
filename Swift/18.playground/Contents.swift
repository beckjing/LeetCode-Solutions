import UIKit

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nCount = nums.count
        var result = [[Int]]()
        if nCount < 4 {
            return result
        }
        let numsSorted = nums.sorted()
        for first in 0...(nCount - 4) {
            if first > 0 && numsSorted[first] == numsSorted[first - 1] {
                continue
            }
            for second in (first + 1)...(nCount - 3) {
                if second > first + 1 && numsSorted[second] == numsSorted[second - 1] {
                    continue
                }
                var third = second + 1
                var fourth = nCount - 1
                while third < fourth {
                    let pre = numsSorted[first] + numsSorted[second] - target
                    let end = numsSorted[third] + numsSorted[fourth]
                    if pre < -end {
                        third += 1
                    }
                    else if pre > -end {
                        fourth -= 1
                    }
                    else {
                        result.append([numsSorted[first],
                                       numsSorted[second],
                                       numsSorted[third],
                                       numsSorted[fourth]])
                        while third < fourth && numsSorted[third] == numsSorted[third + 1] {
                            third += 1
                        }
                        while third < fourth && numsSorted[fourth - 1] == numsSorted[fourth] {
                            fourth -= 1
                        }
                        third += 1
                        fourth -= 1
                    }
                }
            }
        }
        return result
    }
}
