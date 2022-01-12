import Cocoa

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = [Int]()
        var remain = 1
        for digit in digits.reversed() {
            let res = digit + remain
            result.insert((res % 10), at: 0)
            remain = res / 10
        }
        if remain != 0 {
            result.insert(remain, at: 0)
        }
        return result
    }
}
