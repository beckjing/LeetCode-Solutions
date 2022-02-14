import UIKit

class Solution {
    func reverseParentheses(_ s: String) -> String {
        var sArr = [String]()
        var tmp = ""
        for char in s {
            if char == "(" {
                if tmp.count > 0 {
                    sArr.append(tmp)
                    tmp = ""
                }
                sArr.append(String(char))
            }
            else if char == ")" {
                var reS = tmp
                while sArr.last != "(" {
                    let lStr = sArr.popLast()!
                    reS.insert(contentsOf: lStr, at: reS.startIndex)
                }
                sArr.popLast()
                sArr.append(String(reS.reversed()))
                tmp = ""
            }
            else {
                tmp.append(char)
            }
        }
        var result = ""
        for str in sArr {
            result += str
        }
        result += tmp
        return result
    }
}
