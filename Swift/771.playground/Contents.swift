import UIKit

class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        var result = 0
        var jDic = Dictionary<Character, Bool>()
        for char in jewels {
            jDic[char] = true
        }
        for char in stones {
            if jDic[char] == true {
                result += 1
            }
        }
        
        return result
    }
}
