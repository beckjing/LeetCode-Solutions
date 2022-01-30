import UIKit

class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var dic = Dictionary<String, Int>()
        for word in words {
            if dic[word] == nil {
                dic[word] = 0
            }
            dic[word]! += 1
        }
        var dicInt = Dictionary<Int, Array<String>>()
        for (key, value) in dic {
            if dicInt[value] == nil {
                dicInt[value] = Array<String>()
            }
            dicInt[value]!.append(key)
        }
        var index = 0
        var result = [String]()
        let sortedKey: [Int] = dicInt.keys.sorted().reversed()
        while result.count < k {
            let sArr = dicInt[sortedKey[index]]!.sorted()
            var start = 0
            while result.count < k && start < sArr.count {
                result.append(sArr[start])
                start += 1
            }
            index += 1
        }
        return result
    }
}
