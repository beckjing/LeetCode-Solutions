import UIKit

class Solution {
    func maxDepth(_ s: String) -> Int {
        var result = 0
        var tmp = 0
        var stk = Array<Character>()
        for char in s {
            if char == "(" {
                stk.append(char)
                tmp += 1
            }
            else if char == ")" {
                stk.popLast()
                if tmp > result {
                    result = tmp
                }
                tmp -= 1
            }
            
        }
        return result
    }
}
