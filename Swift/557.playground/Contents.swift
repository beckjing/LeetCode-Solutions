import UIKit

class Solution {
    func reverseWords(_ s: String) -> String {
        var startIndex = 0
        var endIndex = 0
        let sCount = s.count
        var result = ""
        for i in 0..<sCount {
            if (s as NSString).substring(with: NSRange.init(location: i, length: 1)) == " " {
                for j in 1...(endIndex - startIndex) {
                    result.append((s as NSString).substring(with: NSRange.init(location: (endIndex - j), length: 1)))
                }
                result.append(" ")
                startIndex = i + 1
                endIndex = i + 1
            }
            else {
                endIndex += 1
            }
        }
        if startIndex < sCount {
            for j in 1...(sCount - startIndex) {
                result.append((s as NSString).substring(with: NSRange.init(location: (sCount - j), length: 1)))
            }
        }
        return result
    }
}

class Solution2 {
    func reverseWords(_ s: String) -> String {
        let split = s.split(separator: " ")
        var result = ""
        for splitStr in split {
            result.append(String(splitStr.reversed()))
            result.append(" ")
        }
        result.removeLast()
        return result
    }
}

