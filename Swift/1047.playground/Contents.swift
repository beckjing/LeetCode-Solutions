import UIKit

class Solution {
    func removeDuplicates(_ s: String) -> String {
        var result = [Character]()
        for char in s {
            if char == result.last {
                result.popLast()
            }
            else {
                result.append(char)
            }
        }
        return String(result)
    }
}

Solution().removeDuplicates("abbaca")
