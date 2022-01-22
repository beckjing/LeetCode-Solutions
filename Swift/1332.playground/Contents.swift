import UIKit

class Solution {
    func removePalindromeSub(_ s: String) -> Int {
        if s.count == 1 {
            return 1
        }
        var sArr = Array<Character>()
        for char in s {
            sArr.append(char)
        }
        if check(sArr) {
            return 1
        }
        return 2
    }
    
    func check(_ s: Array<Character>) -> Bool {
        if s.count > 1 {
            let sCount = s.count / 2 + s.count % 2
            for i in 0...sCount {
                if s[i] != s[s.count - i - 1] {
                    return false
                }
            }
        }
        return true
    }
}

Solution().removePalindromeSub("bbaabaaa")
