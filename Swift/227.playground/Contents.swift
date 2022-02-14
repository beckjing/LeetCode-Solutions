import UIKit

class Solution {
    func calculate(_ s: String) -> Int {
        var sArr = [String]()
        var tmpN = ""
        for char in s {
            if char.isNumber {
                tmpN.append(char)
            }
            else if char == " " {
                if tmpN.count > 0 {
                    sArr.append(tmpN)
                    tmpN = ""
                }
            }
            else {
                if tmpN.count > 0 {
                    sArr.append(tmpN)
                    tmpN = ""
                }
                sArr.append(String(char))
            }
        }
        if tmpN.count > 0 {
            sArr.append(tmpN)
        }
        var stk = [String]()
        var index = 0
        while index < sArr.count {
            let item = sArr[index]
            if item == "/" {
                let pre = stk.popLast()!
                let next = sArr[index + 1]
                stk.append(String(Int(pre)! / Int(next)!))
                index += 1
            }
            else if item == "*" {
                let pre = stk.popLast()!
                let next = sArr[index + 1]
                stk.append(String(Int(pre)! * Int(next)!))
                index += 1
            }
            else {
                stk.append(item)
            }
            index += 1
        }
        index = 0
        var result = 0
        while index < stk.count {
            let item = stk[index]
            if item == "-" {
                result -= Int(stk[index + 1])!
                index += 1
            }
            else if item == "+" {
                
            }
            else {
                result += Int(item)!
            }
            index += 1
        }
        return result
    }
}


Solution().calculate("2*3-4")
