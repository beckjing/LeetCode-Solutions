import UIKit

class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let vArr1 = version1.split(separator: ".")
        let vArr2 = version2.split(separator: ".")
        var index = 0
        while index < vArr1.count && index < vArr2.count {
            let v1 = Int(vArr1[index])!
            let v2 = Int(vArr2[index])!
            if v1 > v2 {
                return 1
            }
            if v1 < v2 {
                return -1
            }
            index += 1
        }
        if index == vArr1.count {
            while index < vArr2.count {
                let v2 = Int(vArr2[index])!
                if v2 > 0 {
                    return -1
                }
                index += 1
            }
            return 0
        }
        else {
            while index < vArr1.count {
                let v1 = Int(vArr1[index])!
                if v1 > 0 {
                    return 1
                }
                index += 1
            }
            return 0
        }
    }
}
