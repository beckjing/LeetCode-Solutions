import UIKit

class Solution {
    func countAndSay(_ n: Int) -> String {
        var result = ""
        for _ in 1...n {
            if result.count == 0 {
                result = "1"
            }
            else {
                var tmp = ""
                var curChar: Character?
                var curCount = 0
                for char in result {
                    if curChar != char {
                        if curCount > 0 {
                            tmp += String(curCount)
                            tmp += String(curChar!)
                        }
                        curChar = char
                        curCount = 1
                    }
                    else {
                        curCount += 1
                    }
                }
                if curCount > 0 {
                    tmp += String(curCount)
                    tmp += String(curChar!)
                }
                result = tmp
            }
            
        }
        return result
    }
}

print(Solution().countAndSay(4))
