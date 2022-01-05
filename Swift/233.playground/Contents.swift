import Cocoa
class Solution {
    func countDigitOne(_ n: Int) -> Int {
        var k = 0
        var mulk = 1
        var ans = 0
        while n >= mulk {
            ans += (n / (mulk * 10)) * mulk + min(max(n % (mulk * 10) - mulk + 1, 0), mulk)
            k += 1
            mulk *= 10
        }
        return ans
                            
    }
}
