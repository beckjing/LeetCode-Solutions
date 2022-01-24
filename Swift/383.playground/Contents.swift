import UIKit

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var mDic = Dictionary<Character, Int>()
        for char in magazine {
            if mDic[char] == nil {
                mDic[char] = 1
            }
            else {
                mDic[char]! += 1
            }
        }
        for char in ransomNote {
            if mDic[char] == nil {
                return false
            }
            else {
                mDic[char]! -= 1
                if mDic[char] == 0 {
                    mDic.removeValue(forKey: char)
                }
            }
        }
        return true
    }
}
