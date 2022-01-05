import Cocoa

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var happyMap = Dictionary<Int, Bool>()
        var happyStr = String(n)
        var result = 0
        while result != 1 {
            for str in happyStr {
                let val = Int(String(str))!
                result += val * val
            }
            if result == 1 {
                return true
            }
            else {
                if happyMap[result] != nil {
                    return false
                }
                happyMap[result] = true
                happyStr = String(result)
                result = 0
            }
        }
        return true
    }
}
