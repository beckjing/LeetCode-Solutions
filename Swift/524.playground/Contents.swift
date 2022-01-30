import UIKit

class Solution {
    func findLongestWord(_ s: String, _ dictionary: [String]) -> String {
        let sortedDic = dictionary.sorted { str1, str2 in
            if str1.count > str2.count {
                return true
            }
            if str1.count == str2.count {
                return str1 < str2
            }
            return false
        }
        for cStr in sortedDic {
            if check(s: s, cStr: cStr) {
                return cStr
            }
        }
        return ""
    }
    
    func check(s: String, cStr: String) -> Bool {
        if s.count >= cStr.count {
            let cArr = Array<Character>(cStr)
            var index = 0
            for char in s {
                if cArr[index] == char {
                    index += 1
                }
                if index == cArr.count {
                    return true
                }
            }
        }
        return false
    }
}
