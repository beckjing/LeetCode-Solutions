import UIKit

class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        var status = 0
        for char in word {
            if status == 0 {
                if char.isUppercase {
                    status = 1
                }
                else if char.isLowercase {
                    status = 2
                }
            }
            else if status == 1 {
                if char.isLowercase {
                    status = 2
                }
                else if char.isUppercase {
                    status = 3
                }
            }
            else if status == 2 {
                if char.isUppercase {
                    return false
                }
            }
            else {
                if char.isLowercase {
                     return false
                }
            }
        }
        return true
    }
}
