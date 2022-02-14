import UIKit

class Solution {
    func longestNiceSubstring(_ s: String) -> String {
        var result = ""
        let sArr = [Character](s)
        for i in 0..<sArr.count {
            for j in i + 1..<sArr.count {
                let subArr = Array(sArr[i...j])
                if check(subArr) {
                    if result.count < subArr.count {
                        result = String(subArr)
                    }
                }
            }
        }
        return result
    }
    
    func check(_ sArr: [Character]) -> Bool {
        var upper = Dictionary<Character, Bool>()
        var lower = Dictionary<Character, Bool>()
        for char in sArr {
            if char.isUppercase {
                upper[char] = true
            }
            else {
                lower[char] = true
            }
        }
        if upper.keys.count != lower.keys.count {
            return false
        }
        for key in upper.keys {
            if lower[key.lowercased().first!] == nil {
                return false
            }
        }
        return true
    }
}
