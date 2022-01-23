import UIKit

class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var result = 0
        let gSorted = g.sorted()
        let sSorted = s.sorted()
        let gCount = gSorted.count
        let sCount = sSorted.count
        var gIndex = 0
        var sIndex = 0
        while gIndex < gCount && sIndex < sCount {
            if sSorted[sIndex] >= gSorted[gIndex] {
                result += 1
                gIndex += 1
            }
            sIndex += 1
        }
        return result
    }
}
