import UIKit

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        print("start")
        let m = s.count
        let n = p.count
        var result = Array<Array<Bool?>>.init(repeating: Array<Bool?>.init(repeating: nil, count: n + 1), count: m + 1)
        result[0][0] = true
        for i in 0...m {
            print("i:\(i)")
            for j in 1...n {
                print("j:\(j)")
                let p_j_idx = p.index(p.startIndex, offsetBy: j - 1)
                let p_j = String(p[p_j_idx...p_j_idx])
                if p_j == "*" {
                    result[i][j] = result[i][j - 2]!
                    print(result)
                    if matches(s, p, i: i, j: j - 1) {
                        result[i][j] = (result[i][j]! || result[i - 1][j]!)
                    }
                }
                else {
                    if matches(s, p, i: i, j: j) {
                        result[i][j] = result[i - 1][j - 1]
                    }
                }
            }
        }
        return result[m][n]!
    }
    
    func matches(_ s: String, _ p: String, i: Int, j: Int) -> Bool {
        print("m_i: \(i); m_j:\(j)")
        if i == 0 {
            return false
        }
        let pStart = p.index(p.startIndex, offsetBy: j - 1)
        let pSub = String(p[pStart...pStart])
        if pSub == "." {
            return true
        }
        let sStart = s.index(s.startIndex, offsetBy: i - 1)
        let sSub = String(s[sStart...sStart])
        return  sSub == pSub
    }
}

print(Solution().isMatch("aa", "a"))
