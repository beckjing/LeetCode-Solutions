import UIKit

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var start = 1
        var end = n
        while start < end {
            var middle = (start + end) / 2
            if isBadVersion(middle) {
                end = middle
            }
            else {
                start = middle + 1
            }
        }
        return start
    }
}
