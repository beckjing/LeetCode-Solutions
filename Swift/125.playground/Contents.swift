import Cocoa

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var sArr = Array<String>()
        for char in s {
            if char.isLetter {
                sArr.append(char.lowercased())
            }
            if char.isNumber {
                sArr.append(String(char.wholeNumberValue!))
            }
        }
        let sCount = sArr.count
        if sCount == 0 {
            return true
        }
        print(sArr)
        for i in 0..<sCount / 2 {
            if sArr[i] != sArr[sCount - i - 1] {
                return false
            }
        }
        return true
    }
}

Solution().isPalindrome("OP")
