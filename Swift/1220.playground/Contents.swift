import UIKit

class Solution {
    
    var status: Dictionary<String, Array<String>> = [
        "a": ["e"],
        "e": ["a", "i"],
        "i": ["a", "e", "o", "u"],
        "o": ["i", "u"],
        "u": ["a"]
    ]
    
    func countVowelPermutation(_ n: Int) -> Int {
        var current = [
            "a": 1,
            "e": 1,
            "i": 1,
            "o": 1,
            "u": 1
        ]
        var remain = n
        var result = 0
        while remain > 0 {
            result = 0
            var tmp = Dictionary<String, Int>()
            for key in current.keys {
                var times = current[key]!
                if times >= 1000000007 {
                    times -= 1000000007
                }
                result += times
                if result >= 1000000007 {
                    result -= 1000000007
                }
                for char in self.status[key]! {
                    if tmp[char] != nil {
                        tmp[char]! += times
                        if tmp[char]! >= 1000000007 {
                            tmp[char]! -= 1000000007
                        }
                    }
                    else {
                        tmp[char] = times
                    }
                }
            }
            current = tmp
            remain -= 1
        }
        return result
    }
}

print(Solution().countVowelPermutation(144))
