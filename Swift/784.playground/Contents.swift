import UIKit

class Solution {
    func letterCasePermutation(_ s: String) -> [String] {
        return letterCasePermutation([Character](s))
    }
    
    func letterCasePermutation(_ sArr: [Character]) -> [String] {
        var result = [String]()
        if sArr.count == 0 {
            return result
        }
        let first = sArr.first!
        if first.isNumber {
            let tmp = String(first)
            if sArr.count > 1 {
                let subRes = letterCasePermutation(Array(sArr[1..<sArr.count]))
                for subR in subRes {
                    var tmpR = tmp
                    tmpR.append(subR)
                    result.append(tmpR)
                }
            }
            else {
                result.append(tmp)
            }
        }
        else {
            let tmpU = first.uppercased()
            let tmpL = first.lowercased()
            if sArr.count > 1 {
                let subRes = letterCasePermutation(Array(sArr[1..<sArr.count]))
                for subR in subRes {
                    var subU = tmpU
                    var subL = tmpL
                    subU.append(subR)
                    subL.append(subR)
                    result.append(subU)
                    result.append(subL)
                }
            }
            else {
                result.append(tmpU)
                result.append(tmpL)
            }
            
        }
        return result
    }
}
