import UIKit

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        var result = Array<String>()
        var digitFirst: Character = digits.first
        for digit in self.digitsMap[digitFirst] {
            
        }
        return result
    }
    
    var digitsMap: [Character: String] = [
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
