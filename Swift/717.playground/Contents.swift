import UIKit

class Solution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        let bCount = bits.count
        if bCount == 0 {
            return false
        }
        if bCount == 1 {
            return true
        }
        if bits.first == 0 {
            return isOneBitCharacter(Array(bits[1...bCount - 1]))
        }
        if bCount == 2 {
            return false
        }
        return isOneBitCharacter(Array(bits[2...bCount - 1]))
    }
    
}

Solution().isOneBitCharacter([1,1,0])
