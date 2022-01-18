import UIKit

class Solution {
    func findMinDifference(_ timePoints: [String]) -> Int {
        var result = Int.max
        let times = timePoints.sorted { first, second in
            let fArr = first.components(separatedBy: ":")
            let sArr = second.components(separatedBy: ":")
            if Int(fArr.first!)! < Int(sArr.first!)! {
                return true
            }
            if Int(fArr.first!)! == Int(sArr.first!)! {
                if Int(fArr.last!)! < Int(sArr.last!)! {
                    return true
                }
            }
            return false
        }
        result = calculate(little: times.first!, big: times.last!)
        for i in 1..<times.count {
            let diff = calculate(little: times[i - 1], big: times[i])
            if diff < result {
                result = diff
            }
        }
        return result
    }
    
    func calculate(little: String, big: String) -> Int {
        let lArr = little.components(separatedBy: ":")
        let bArr = big.components(separatedBy: ":")
        let result = (Int(bArr.first!)! - Int(lArr.first!)!) * 60 + (Int(bArr.last!)! - Int(lArr.last!)!)
        if result > 720 {
            return 1440 - result
        }
        return result
    }
}

Solution().findMinDifference(["23:59","00:00"])
