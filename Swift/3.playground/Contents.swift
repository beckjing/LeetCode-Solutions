import UIKit

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var sMap = Dictionary<String.Element, Int>()
        var startIndex = 0
        var maxlength = 0
        for (index, char) in s.enumerated() {
            if sMap[char] == nil {
                sMap[char] = index
            }
            else {
                if sMap[char]! >= startIndex {
                    startIndex = sMap[char]! + 1
                }
                sMap[char] = index
            }
//            print(sMap)
//            print("start:\(startIndex), index:\(index)")
            maxlength = max(maxlength, (index - startIndex + 1))
        }
        return maxlength
    }
}

print(Solution().lengthOfLongestSubstring("abcabcbb"))
