import UIKit

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var checkDic = Dictionary<Character, Int>()
        for char in s {
            if checkDic[char] == nil {
                checkDic[char] = 1
            }
            else {
                checkDic[char]! += 1
            }
        }
        for char in t {
            if checkDic[char] == nil {
                return false
            }
            else {
                checkDic[char]! -= 1
                if checkDic[char]! < 0 {
                    return false
                }
            }
        }
        return s.count == t.count
    }
}
