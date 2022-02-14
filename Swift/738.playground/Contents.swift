import UIKit

class Solution {
    func monotoneIncreasingDigits(_ n: Int) -> Int {
        var nStr = Array<Character>(String(n))
        var index = 1
        while index < nStr.count && Int(String(nStr[index - 1]))! <= Int(String(nStr[index]))! {
            index += 1
        }
        if index < nStr.count {
            while index > 0 && Int(String(nStr[index - 1]))! > Int(String(nStr[index]))! {
                nStr[index - 1] = String(Int(String(nStr[index - 1]))! - 1).first!
                index -= 1
            }
            for i in index + 1..<nStr.count {
                nStr[i] = "9"
            }
            return Int(String(nStr))!
        }
        else {
            return n
        }
    }
}

print(Solution().monotoneIncreasingDigits(332))
