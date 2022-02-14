import UIKit

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        if k == 0 {
            return num
        }
        if k == num.count {
            return "0"
        }
        var remain = k
        var stk = ""
        var index = 0
        let nArr = [Character](num)
        let nCount = num.count
        while index < nCount {
            while stk.last != nil && stk.last! > nArr[index] && remain > 0 {
                stk.popLast()
                remain -= 1
            }
            stk.append(nArr[index])
            index += 1
        }
        while remain > 0 {
            stk.popLast()
            remain -= 1
        }
        while stk.first == "0" {
            stk.removeFirst()
        }
        if stk.count == 0 {
            return "0"
        }
        return stk
    }
}

print(Solution().removeKdigits("112", 1))
