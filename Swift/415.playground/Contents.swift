import UIKit

class Solution {
    
    func addStrings(_ num1: String, _ num2: String) -> String {
        var result = ""
        let longN: [Character] = num1.count > num2.count ? num1.reversed() : num2.reversed()
        let shortN: [Character] = num1.count <= num2.count ? num1.reversed() : num2.reversed()
        let lCount = longN.count
        let sCount = shortN.count
        var remain = 0
        for i in 0..<lCount {
            if i < sCount {
                remain += Int(String(longN[i]))! + Int(String(shortN[i]))!
                result.append(String(remain % 10))
            }
            else {
                remain += Int(String(longN[i]))!
                result.append(String(remain % 10))
            }
            remain /= 10
        }
        if remain > 0 {
            result.append(String(remain))
        }
        return String(result.reversed())
    }
}

print(Solution().addStrings("11", "123"))
