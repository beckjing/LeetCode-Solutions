import UIKit

class Solution {
    
    func partition(_ s: String) -> [[String]] {
        return partition(Array<Character>(s))
    }
    
    func partition(_ s: [Character]) -> [[String]] {
        let sCount = s.count
        var result = [[String]]()
        if sCount > 0 {
            var end = 0
            while end < s.count {
                if check(Array(s[0...end])) {
                    var tmp = ""
                    for i in 0...end {
                        tmp.append(s[i])
                    }
                    let subRes = partition(Array(s[end + 1..<sCount]))
                    if subRes.count > 0 {
                        for subR in subRes {
                            var tmpR = [String]()
                            tmpR.append(tmp)
                            tmpR.append(contentsOf: subR)
                            result.append(tmpR)
                        }
                    }
                    else {
                        result.append([tmp])
                    }
                }
                
                end += 1
            }
            
        }
        return result
    }
 
    func check(_ sArr: [Character]) -> Bool {
        let sCount = sArr.count
        if sCount >= 2 {
            let middle = sCount / 2
            for i in 0..<middle {
                if sArr[i] != sArr[sCount - i - 1] {
                    return false
                }
            }
        }
        return true
    }
}

print(Solution().partition("aab"))
