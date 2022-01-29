import UIKit

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        var sArr = Array<String>()
        for num in nums {
            sArr.append(String(num))
        }
        var result = ""
        sArr = sArr.sorted(by: { str1, str2 in
            let big = check(str1: str1, str2: str2)
            print(str1, str2, big)
            return big
        })
        for s in sArr {
            if result.count == 0 && s == "0" {
                continue
            }
            result.append(s)
        }
        if result.count == 0 {
            return "0"
        }
        return result
    }
    
    func check(str1: String, str2: String) -> Bool {
        if Int(str1 + str2)! >= Int(str2 + str1)! {
            return true
        }
        return false
    }
}
