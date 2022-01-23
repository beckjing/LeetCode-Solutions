import UIKit

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var sArr = Array<Character>()
        var sSet = Set<Int>()
        var sDic = Dictionary<Character, Int>()
        for char in s {
            sArr.append(char)
        }
        let sCount = sArr.count
        var index = 0
        while index < sCount {
            if sDic[sArr[index]] == nil {
                sDic[sArr[index]] = index
                sSet.insert(index)
            }
            else {
                sSet.remove(sDic[sArr[index]]!)
                sDic[sArr[index]]! = -1
            }
            index += 1
        }
        if sSet.count == 0 {
            return -1
        }
        let result = Array(sSet)
        return result.sorted().first!
    }
}
