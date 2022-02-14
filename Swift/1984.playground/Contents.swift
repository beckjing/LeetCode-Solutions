import UIKit

class Solution {
    func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
        let sortedN = nums.sorted()
        let sCount = sortedN.count
        var result = sortedN[k - 1] - sortedN[0]
        var index = k
        while index < sCount {
            result = min(result, sortedN[index] - sortedN[index - k - 1])
            index += 1
        }
        return result
    }
}
