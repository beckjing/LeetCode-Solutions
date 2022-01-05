import Cocoa

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let numCount = nums.count
        if numCount > 1 {
            for i in 0..<numCount {
                var numsCopy = nums
                let removeItem = numsCopy.remove(at: i)
                let tmpRes = self.permute(numsCopy)
                for tmpRe in tmpRes {
                    var tmpReCopy: [Int] = tmpRe
                    tmpReCopy.insert(removeItem, at: 0)
                    result.append(tmpReCopy)
                }
            }
        }
        else if numCount == 1 {
            result.append([nums.first!])
        }
        return result
    }
}
