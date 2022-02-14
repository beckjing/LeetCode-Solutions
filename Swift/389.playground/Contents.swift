import UIKit

class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var tDic = Dictionary<Character, Int>()
        for char in t {
            if tDic[char] == nil {
                tDic[char] = 0
            }
            tDic[char]! += 1
        }
        for char in s {
            tDic[char]! -= 1
            if tDic[char] == 0 {
                tDic.removeValue(forKey: char)
            }
        }
        return tDic.keys.first!
    }
}

Solution().findTheDifference("abcd", "abcde")
