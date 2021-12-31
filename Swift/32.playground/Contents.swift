import Cocoa

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var left = 0
        var right = 0
        var maxLen = 0
        let sCount = s.count
        for sChar in s {
            if sChar == "(" {
                left += 1
            }
            else if sChar == ")" {
                right += 1
            }
            if left == right {
                maxLen = maxLen < (right * 2) ? (right * 2) : maxLen
            }
            else if right > left {
                right = 0
                left = 0
            }
        }
        left = 0
        right = 0
        for sChar in s.reversed() {
            if sChar == "(" {
                left += 1
            }
            else if sChar == ")" {
                right += 1
            }
            if left == right {
                maxLen = maxLen < (right * 2) ? (right * 2) : maxLen
            }
            else if right < left {
                right = 0
                left = 0
            }
        }
        return maxLen
    }
}

Solution().longestValidParentheses("(()")
