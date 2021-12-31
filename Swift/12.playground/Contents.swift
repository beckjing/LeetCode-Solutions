import Cocoa

class Solution {
    func intToRoman(_ num: Int) -> String {
        var result = ""
        var remain = num
        let thousand = num / 1000
        if thousand > 0 {
            for _ in 0..<thousand {
                result.append("M")
            }
            remain = num - thousand * 1000
        }
        if remain >= 900 {
            result.append("CM")
            remain -= 900
        }
        else if remain >= 500 {
            result.append("D")
            remain -= 500
        }
        else if remain >= 400 {
            result.append("CD")
            remain -= 400
        }
        let hun = remain / 100
        if hun > 0 {
            for _ in 0..<hun {
                result.append("C")
            }
            remain -= hun * 100
        }
        if remain >= 90 {
            result.append("XC")
            remain -= 90
        }
        else if remain >= 50 {
            result.append("L")
            remain -= 50
        }
        else if remain >= 40 {
            result.append("XL")
            remain -= 40
        }
        let ten = remain / 10
        if ten > 0 {
            for _ in 0..<ten {
                result.append("X")
            }
            remain -= ten * 10
        }
        if remain >= 9 {
            result.append("IX")
            remain -= 9
        }
        else if remain >= 5 {
            result.append("V")
            remain -= 5
        }
        else if remain >= 4 {
            result.append("IV")
            remain -= 4
        }
        if remain > 0 {
            for _ in 0..<remain {
                result.append("I")
            }
        }
        return result
    }
}

print(Solution().intToRoman(3))
