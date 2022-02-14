import UIKit

class Solution {
    func reverseVowels(_ s: String) -> String {
        var result = [Character](s)
        var aeiou = [Character]()
        let set: Set<Character> = Set<Character>("aeiouAEIOU")
        for char in result {
            if set.contains(char) {
                aeiou.append(char)
            }
        }
        var index = 0
        var aIndex = aeiou.count - 1
        let sCount = result.count
        while index < sCount {
            if set.contains(result[index]) {
                result[index] = aeiou[aIndex]
                aIndex -= 1
            }
            index += 1
        }
        return String(result)
    }
}
