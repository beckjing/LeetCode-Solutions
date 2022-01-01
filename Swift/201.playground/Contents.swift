import Cocoa

class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var rightVal = right
        while left < rightVal {
            rightVal = rightVal & (rightVal - 1)
        }
        return rightVal
    }
}
