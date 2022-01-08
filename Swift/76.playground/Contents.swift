import UIKit

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var need = Dictionary<Character, Int>()
        var arr = Array<Character>()
        for char in s {
            arr.append(char)
        }
        for char in t {
            if need[char] == nil {
                need[char] = 1
            }
            else {
                need[char]! += 1
            }
        }
        var nCount = need.count
        var left = 0
        var right = 0
        var rleft = 0
        var rRight = 0
        var rCount = 0
        for rChar in arr {
            if need[rChar] != nil {
                if need[rChar] == 1 {
                    nCount -= 1
                }
                need[rChar]! -= 1
                if nCount == 0 {
                    var lChar = arr[left]
                    while need[lChar] == nil || need[lChar]! < 0 {
                        left += 1
                        if need[lChar] != nil {
                            need[lChar]! += 1
                        }
                        lChar = arr[left]
                    }
                    if rCount == 0 || rCount > (right - left + 1) {
                        rleft = left
                        rRight = right
                        rCount = rRight - rleft + 1
                    }
                }
            }
            right += 1
        }
        if nCount == 0 {
            return String(s[s.index(s.startIndex, offsetBy: rleft)...s.index(s.startIndex, offsetBy: rRight)])
        }
        return ""
    }
}


Solution().minWindow("cabwefgewcwaefgcf", "cae")
