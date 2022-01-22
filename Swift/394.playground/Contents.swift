import UIKit

class Solution {
    func decodeString(_ s: String) -> String {
        var sArr = Array<Character>()
        for char in s {
            sArr.append(char)
        }
        return decodeString(sArr)
    }
    
    func decodeString(_ s: Array<Character>) -> String {
        var result = ""
        var tmpN = ""
        var tmpS = ""
        var index = 0
        var stk = Array<String>()
        while index < s.count {
            if s[index].isLetter {
                tmpS.append(s[index])
            }
            else if s[index].isNumber {
                if tmpS.count > 0 {
                    stk.append(tmpS)
                    tmpS = ""
                }
                tmpN.append(s[index])
            }
            else if s[index] == "[" {
                stk.append(tmpN)
                stk.append("[")
                tmpN = ""
            }
            else if s[index] == "]" {
                if tmpS.count > 0 {
                    stk.append(tmpS)
                    tmpS = ""
                }
                stk.append("]")
            }
            index += 1
        }
        if tmpS.count > 0 {
            stk.append(tmpS)
        }
        var stk2 = Array<String>()
        for item in stk {
            if stk2.count == 0 {
                if item.first!.isLetter {
                    result += item
                }
                else {
                    stk2.append(item)
                }
            }
            else {
                var tmp = ""
                if item.first!.isLetter {
                    tmp = item
                    while stk2.last!.first!.isLetter {
                        var last = stk2.popLast()!
                        last.append(tmp)
                        tmp = last
                    }
                    stk2.append(tmp)
                }
                else if item == "]" {
                    let str = stk2.popLast()!
                    stk2.popLast()
                    let number = Int(stk2.popLast()!)!
                    for _ in 1...number {
                        tmp.append(str)
                    }
                    if stk2.last == nil {
                        result += tmp
                    }
                    else if stk2.last == "[" {
                        stk2.append(tmp)
                    }
                    else {
                        while stk2.last!.first!.isLetter {
                            var last = stk2.popLast()!
                            last.append(tmp)
                            tmp = last
                        }
                        stk2.append(tmp)
                    }
                }
                else {
                    stk2.append(item)
                }
            }
        }
        if stk2.last != nil {
            result.append(stk2.last!)
        }
        return result
    }
}

Solution().decodeString("sd2[f2[e]g]i")
