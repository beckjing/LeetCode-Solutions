import UIKit

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result = [[String]]()
        var dic = Dictionary<String, Array<String>>()
        for str in strs {
            let key = String(str.sorted())
            if dic[key] == nil {
                dic[key] = Array<String>()
            }
            dic[key]!.append(str)
        }
        for value in dic.values {
            result.append(value)
        }
        return result
    }
}
