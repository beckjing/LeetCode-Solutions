import UIKit

class Solution {
    func isUnique(_ astr: String) -> Bool {
        var sSet = Set<Character>()
        for char in astr {
            if sSet.contains(char) {
                return false
            }
            sSet.insert(char)
        }
        return true
    }
}
