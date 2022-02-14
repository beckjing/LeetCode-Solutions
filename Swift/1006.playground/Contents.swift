import UIKit

class Solution {
    
    func clumsy(_ n: Int) -> Int {
        var remain = n
        var result = 0
        while remain > 3 {
            if result == 0 {
                result += cal(start: remain, end: remain - 2)
            }
            else {
                result -= cal(start: remain, end: remain - 2)
            }
            result += remain - 3
            remain -= 4
        }
        if remain == 1 {
            if result == 0 {
                result += remain
            }
            else {
                result -= remain
            }
        }
        else if remain == 2 {
            if result == 0 {
                result = remain * (remain - 1)
            }
            else {
                result = result - remain * (remain - 1)
            }
        }
        else if remain == 3 {
            if result == 0 {
                result = remain * (remain - 1) / (remain - 2)
            }
            else {
                result = result - remain * (remain - 1) / (remain - 2)
            }
        }
        return result
    }
    
    func cal(start: Int, end: Int) -> Int {
        return start * (start - 1) / end
    }
    
}
