import UIKit

class Solution {
    func frequencySort(_ s: String) -> String {
        var dic = Dictionary<Character, Int>()
        var result = ""
        for char in s {
            if dic[char] == nil {
                dic[char] = 0
            }
            dic[char]! += 1
        }
        let sortedKey = dic.keys.sorted { char1, char2 in
            return dic[char1]! > dic[char2]!
        }
        for key in sortedKey {
            let count = dic[key]!
            for i in 1...count {
                result.append(key)
            }
        }
        return result
    }
}
