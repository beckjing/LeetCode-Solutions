import UIKit

class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        var sArr = Array<Character>()
        for char in s {
            sArr.append(char)
        }
        return restoreIpAddresses(sArr, 4)
    }
    
    func restoreIpAddresses(_ s: Array<Character>, _ remain: Int) -> [String] {
        var result = [String]()
        if remain == 1 {
            if s.count > 0 {
                var tmp = ""
                for char in s {
                    tmp.append(char)
                }
                if tmp.first == "0" && tmp.count > 1 {
                    return result
                }
                if Int(tmp)! < 256 {
                    result.append(tmp)
                }
            }
        }
        else {
            if s.count < remain {
                return result
            }
            if s.count > 1 {
                let tmp1 = String(s[0])
                let subRes = restoreIpAddresses(Array(s[1..<s.count]), remain - 1)
                for res in subRes {
                    result.append("\(tmp1).\(res)")
                }
            }
            if s.count > 2 && s.first != "0" {
                let tmp2 = "\(s[0])\(s[1])"
                let subRes = restoreIpAddresses(Array(s[2..<s.count]), remain - 1)
                for res in subRes {
                    result.append("\(tmp2).\(res)")
                }
            }
            if s.count > 3 && s.first != "0" {
                let tmp3 = "\(s[0])\(s[1])\(s[2])"
                if Int(tmp3)! < 256 {
                    let subRes = restoreIpAddresses(Array(s[3..<s.count]), remain - 1)
                    for res in subRes {
                        result.append("\(tmp3).\(res)")
                    }
                }
            }
        }
        return result
    }
}
