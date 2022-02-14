import UIKit

class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        var sArr = [Character]()
        var tArr = [Character]()
        for char in s {
            if char == "#" {
                sArr.popLast()
            }
            else {
                sArr.append(char)
            }
        }
        for char in t {
            if char == "#" {
                tArr.popLast()
            }
            else {
                tArr.append(char)
            }
        }
        if sArr.count != tArr.count {
            return false
        }
        for i in 0..<sArr.count {
            if sArr[i] != tArr[i] {
                return false
            }
        }
        return true
    }
}
