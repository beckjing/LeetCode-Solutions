import UIKit

class Solution {
    
    func permutation(_ s: String) -> [String] {
        let sArr = Array<Character>(s)
        let tmpR = permutation(sArr)
        var result = [String]()
        for tmp in tmpR {
            var subRes = ""
            for char in tmp {
                subRes.append(char)
            }
            result.append(subRes)
        }
        return [String](Set<String>(result))
    }
    
    func permutation(_ s: [Character]) -> [[Character]] {
        var result = [[Character]]()
        if s.count <= 1 {
            result.append(s)
            return result
        }
        var index = 0
        while index < s.count {
            var subS = s
            subS.remove(at: index)
            let subRes = permutation(subS)
            for sub in subRes {
                var tmpRes = Array<Character>()
                tmpRes.append(s[index])
                tmpRes.append(contentsOf: sub)
                result.append(tmpRes)
            }
            index += 1
        }
        return result
    }
}

print(Solution().permutation("abc"))
