import UIKit

class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        var current = chars.first!
        var cCount = 1
        var index = 1
        var newIndex = 0
        let charCount = chars.count
        while index < charCount {
            if chars[index] == current {
                cCount += 1
            }
            else {
                chars[newIndex] = current
                newIndex += 1
                if cCount > 1 {
                    let number = String(cCount)
                    for nChar in number {
                        chars[newIndex] = nChar
                        newIndex += 1
                    }
                    cCount = 1
                }
                current = chars[index]
            }
            index += 1
        }
        chars[newIndex] = current
        newIndex += 1
        if cCount > 1 {
            let number = String(cCount)
            for nChar in number {
                chars[newIndex] = nChar
                newIndex += 1
            }
        }
        return newIndex
    }
}
