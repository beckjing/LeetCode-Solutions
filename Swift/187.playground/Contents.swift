import UIKit

class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        var dic = Dictionary<String, Int>()
        let sArr = Array<Character>(s)
        var result = [String]()
        if s.count <= 10 {
            return result
        }
        for i in 0...s.count - 10 {
            let key = String(Array(sArr[i..<i + 10]))
            if dic[key] == nil {
                dic[key] = 0
            }
            dic[key]! += 1
        }
        let filtered = dic.filter { (key: String, value: Int) in
            return value >= 2
        }
        result.append(contentsOf: filtered.keys)
        return result
    }
}
