import UIKit

class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var result = 0
        var dic = Dictionary<Int, Int>()
        for interval in intervals {
            if dic[interval.first!] == nil {
                dic[interval.first!] = interval.last!
            }
            else {
                result += 1
                dic[interval.first!] = min(dic[interval.first!]!, interval.last!)
            }
        }
        let sortedKey = dic.keys.sorted()
        var right = dic[sortedKey.first!]!
        for i in 1..<sortedKey.count {
            let key = sortedKey[i]
            if key < right {
                result += 1
                right = min(right, dic[key]!)
            }
            else {
                right = dic[key]!
            }
        }
        return result
    }
}
