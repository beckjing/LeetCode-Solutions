import UIKit

class Solution {
    
    func longestSubstring(_ sArr: [Character], _ k: Int) -> Int {
        let sCount = sArr.count
        if k == 1 {
            return sCount
        }
        var result = 0
        var aDic = [Character : Int]()
        for i in 0..<sCount {
            if aDic[sArr[i]] == nil {
                aDic[sArr[i]] = 0
            }
            aDic[sArr[i]]! += 1
        }
        let dFilter = aDic.filter { (key: Character, value: Int) in
            return value < k
        }
        if dFilter.keys.count == 0 {
            return sCount
        }
        var start = 0
        var pre = 0
        while start < sCount {
            if dFilter[sArr[start]] != nil {
                if start == pre {
                    pre += 1
                }
                else if result < start - pre {
                    let subArr = Array(sArr[pre...start - 1])
                    result = max(result, longestSubstring(subArr, k))
                    pre = start + 1
                }
            }
            start += 1
        }
        if result < start - pre {
            let subArr = Array(sArr[pre...start - 1])
            result = max(result, longestSubstring(subArr, k))
        }
        return result
    }
    
    func longestSubstring(_ s: String, _ k: Int) -> Int {
        return longestSubstring([Character](s), k)
    }
}

Solution().longestSubstring("bbaaacbd", 3)
