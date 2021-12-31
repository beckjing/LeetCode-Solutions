import Cocoa

class Solution {
    func nearestPalindromic(_ n: String) -> String {
        let nCount = n.count
        let nValue = Int(n)!
        let powValue = Int(pow(Double(10), Double(nCount - 1)))
        if nValue < 10 || nValue == powValue {
            return String(nValue - 1)
        }
        if nValue == powValue + 1 {
            return String(nValue - 2)
        }
        if nValue == powValue * 10 - 1 {
            return String(nValue + 2)
        }
        if nCount % 2 == 0 {
            let pre = Int(n[n.index(n.startIndex, offsetBy: 0)..<n.index(n.startIndex, offsetBy: nCount / 2)])!
            let pre1 = String(pre - 1)
            let result1 = pre1 + String(pre1.reversed())
            let pre2 = String(pre)
            let result2 = pre2 + String(pre2.reversed())
            let pre3 = String(pre + 1)
            let result3 = pre3 + String(pre3.reversed())
            var min = Int(result1)!
            if abs(min - nValue) > abs(Int(result2)! - nValue)  && Int(result2)! != nValue {
                min = Int(result2)!
            }
            if abs(min - nValue) > abs(Int(result3)! - nValue) {
                min = Int(result3)!
            }
            return String(min)
        }
        else {
            let pre = Int(n[n.index(n.startIndex, offsetBy: 0)..<n.index(n.startIndex, offsetBy: nCount / 2 + 1)])!
            let pre1 = String(pre - 1)
            let result1 = pre1 + String(pre1.reversed()[1..<pre1.count])
            let pre2 = String(pre)
            let result2 = pre2 + String(pre2.reversed()[1..<pre2.count])
            let pre3 = String(pre + 1)
            let result3 = pre3 + String(pre3.reversed()[1..<pre3.count])
            var min = Int(result1)!
            if abs(min - nValue) > abs(Int(result2)! - nValue)  && Int(result2)! != nValue {
                min = Int(result2)!
            }
            if abs(min - nValue) > abs(Int(result3)! - nValue) {
                min = Int(result3)!
            }
            return String(min)
        }
    }
}

print(Solution().nearestPalindromic("99"))
