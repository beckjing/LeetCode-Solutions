import UIKit

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var singleDic = Dictionary<Character, Int>()
        var doubleDic = Dictionary<Character, Int>()
        var result = 0
        for char in s {
            if singleDic[char] != nil {
                doubleDic[char] = singleDic[char]! + 1
                singleDic.removeValue(forKey: char)
            }
            else if doubleDic[char] != nil {
                singleDic[char] = doubleDic[char]! + 1
                doubleDic.removeValue(forKey: char)
            }
            else {
                singleDic[char] = 1
            }
        }
        for value in singleDic.values {
            result += value - 1
        }
        if singleDic.values.count > 0 {
            result += 1
        }
        for value in doubleDic.values {
            result += value
        }
        return result
    }
}

Solution().longestPalindrome("abccccdd")
