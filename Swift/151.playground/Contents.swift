import UIKit

class Solution {
    func reverseWords(_ s: String) -> String {
        var sArr = Array<Character>()
        var result = ""
        for char in s {
            sArr.append(char)
        }
        var index = sArr.count - 1
        while index >= 0 {
            if sArr[index] != " " {
                var tmp = ""
                while index >= 0 && sArr[index] != " " {
                    tmp.append(sArr[index])
                    index -= 1
                }
                result += tmp.reversed()
                result += " "
            }
            else {
                index -= 1
            }
        }
        if result.count > 0 {
            result.removeLast()
        }
        return result
    }
}

Solution().reverseWords("the sky is blue")
