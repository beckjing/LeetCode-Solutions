import UIKit

class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        let wArr = [Character](word)
        var result = [Character]()
        var index = 0
        while index < wArr.count {
            if wArr[index] == ch {
                break
            }
            index += 1
        }
        if index < wArr.count {
            result.append(contentsOf: wArr[0...index].reversed())
            result.append(contentsOf: wArr[index + 1..<wArr.count])
        }
        else {
            result = wArr
        }
        return String(result)
    }
}
