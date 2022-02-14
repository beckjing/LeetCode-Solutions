import UIKit

class Solution {
    func minimumLengthEncoding(_ words: [String]) -> Int {
        var wSet = Set<String>(words)
        let cSet = wSet
        for str in cSet {
            var tmpS = str
            while tmpS.count > 0 {
                tmpS.removeFirst()
                if wSet.contains(tmpS) {
                    wSet.remove(tmpS)
                }
            }
        }
        var result = 0
        for word in wSet {
            result += word.count + 1
        }
        return result
    }
}
