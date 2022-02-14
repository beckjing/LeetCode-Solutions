import UIKit

class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        let sArr = Array<Character>(secret)
        let gArr = Array<Character>(guess)
        var dicS = Dictionary<Character, Int>()
        var dicG = Dictionary<Character, Int>()
        var bull = 0
        var cows = 0
        var index = 0
        while index < sArr.count {
            if sArr[index] == gArr[index] {
                bull += 1
            }
            else {
                if dicS[sArr[index]] == nil {
                    dicS[sArr[index]] = 0
                }
                dicS[sArr[index]]! += 1
                if dicG[gArr[index]] == nil {
                    dicG[gArr[index]] = 0
                }
                dicG[gArr[index]]! += 1
            }
            index += 1
        }
        for key in dicG.keys {
            if dicS[key] != nil {
                cows += min(dicS[key]!, dicG[key]!)
            }
        }
        return "\(bull)A\(cows)B"
    }
}
