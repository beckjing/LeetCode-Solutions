import UIKit

class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let sArr = s.split(separator: " ")
        let pArr = Array<Character>(pattern)
        var dicP = Dictionary<Character, String>()
        var dicS = Dictionary<String, Character>()
        if pattern.count != sArr.count {
            return false
        }
        let pCount = pattern.count
        for i in 0..<pCount {
            let subString = String(sArr[i])
            if dicP[pArr[i]] == nil {
                dicP[pArr[i]] = subString
            }
            else {
                if dicP[pArr[i]] != subString {
                    return false
                }
            }
            if dicS[subString] == nil {
                dicS[subString] = pArr[i]
            }
            else {
                if dicS[subString] != pArr[i] {
                    return false
                }
            }
        }
        return true
    }
}
