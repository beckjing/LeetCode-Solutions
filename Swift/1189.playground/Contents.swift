import UIKit

class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        var dic = Dictionary<Character, Int>()
        dic["b"] = 0
        dic["a"] = 0
        dic["l"] = 0
        dic["o"] = 0
        dic["n"] = 0
        for char in text {
            if dic[char] == nil {
                dic[char] = 0
            }
            dic[char]! += 1
        }
        return min(dic["b"]!, dic["a"]!, dic["l"]! / 2, dic["o"]! / 2, dic["n"]!)
    }
}
