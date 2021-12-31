import UIKit

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var sMap = Dictionary<String.Element, Int>()
        for char in s1 {
            if sMap[char] == nil {
                sMap[char] = 1
            }
            else {
                sMap[char]! += 1
            }
        }
        let sCount = s1.count
        var sIndex = 0
        var sMap2 = Dictionary<String.Element, Int>()
        for char in s2 {
            if sMap2[char] == nil {
                sMap2[char] = 1
            }
            else {
                sMap2[char]! += 1
            }
            sIndex += 1
            if sIndex - sCount > 0 {
                let deleteChar = s2[s2.index(s2.startIndex, offsetBy: sIndex - sCount - 1)]
                let deleteCount = sMap2[deleteChar]! - 1
                sMap2[deleteChar] = deleteCount == 0 ? nil : deleteCount
                
            }
            if sIndex >= sCount {
                var hasSub = true
                print(sMap)
                print(sMap2)
                for key in sMap2.keys {
                    if sMap2[key] != sMap[key]  {
                        hasSub = false
                        break
                    }
                }
                if hasSub == true {
                    return true
                }
            }
        }
        return false
    }
}
print(Solution().checkInclusion("ab", "eidbaooo"))
