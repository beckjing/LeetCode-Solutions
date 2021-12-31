import UIKit

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        var result = Array<String>()
        if digits.count > 1 {
            let digitFirst = digits.first!
            let subString = String(digits[digits.index(digits.startIndex, offsetBy: 1)...digits.index(digits.startIndex, offsetBy: digits.count - 1)])
            let subResult = self.letterCombinations(subString)
            var tempRes = Array<String>()
            for dig in self.digitsMap[digitFirst]! {
                if subResult.count > 0 {
                    for subRes in subResult {
                        tempRes.append(String(dig)+subRes)
                    }
                }
                else {
                    tempRes.append(String(dig))
                }
            }
            result.append(contentsOf: tempRes)
        }
        else if digits.count == 1 {
            let digitFirst = digits.first!
            for dig in self.digitsMap[digitFirst]! {
                result.append(String(dig))
            }
        }
        return result
    }
    
    let digitsMap: [Character : String] = [
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz",
    ]
}

print(Solution().letterCombinations("23"))
