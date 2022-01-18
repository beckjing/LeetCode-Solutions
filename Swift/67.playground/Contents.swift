import Cocoa

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var remain = 0
        var result = ""
        let aCount = a.count
        let bCount = b.count
        var longArr = Array<Character>()
        var shortArr = Array<Character>()
        if aCount > bCount {
            for char in a {
                longArr.append(char)
            }
            for char in b {
                shortArr.append(char)
            }
        }
        else {
            for char in b {
                longArr.append(char)
            }
            for char in a {
                shortArr.append(char)
            }
        }
        let lCount = longArr.count
        let sCount = shortArr.count
        longArr = longArr.reversed()
        shortArr = shortArr.reversed()
        var index = 0
        while index < sCount {
            if longArr[index] == shortArr[index] {
                result += String(remain)
                remain = Int(String(longArr[index]))!
            }
            else {
                result += remain == 1 ? "0" : "1"
            }
            index += 1
        }
        while index < lCount {
            if longArr[index] == "0" {
                result += String(remain)
                remain = 0
            }
            else {
                result += remain == 0 ? "1" : "0"
            }
            index += 1
        }
        if remain > 0 {
            result += "1"
        }
        return String(result.reversed())
    }
}

Solution().addBinary("11", "1")
