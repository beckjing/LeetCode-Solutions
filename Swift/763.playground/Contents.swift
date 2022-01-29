import UIKit

class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        return partitionLabels_inner(Array<Character>(s))
    }
    
    func partitionLabels_inner(_ s: [Character]) -> [Int] {
        var result = [Int]()
        var dic = Dictionary<Character, Int>()
        var arrI = [[Int]]()
        let sCount = s.count
        var index = 0
        while index < sCount {
            let char = s[index]
            if dic[char] == nil {
                dic[char] = arrI.count
                arrI.append([index, index])
            }
            else {
                let charIndex = dic[char]!
                var charRange = arrI[charIndex]
                charRange[1] = index
                arrI[charIndex] = charRange
            }
            index += 1
        }
        var start = 0
        var end = 0
        for range in arrI {
            if range.first! > end {
                result.append(range.first! - start)
                start = range.first!
                end = range.last!
            }
            else {
                end = max(range.last!, end)
            }
        }
        result.append(end - start + 1)
        return result
    }
}

Solution().partitionLabels("ababcbacadefegdehijhklij")
