import UIKit

class Solution {
    func reverseString(_ s: inout [Character]) {
        var s_count = s.count
        for i in 0...(s_count / 2) {
            var tmp = s[i]
            s[i] = s[s_count - i - 1]
            s[s_count - i - 1] = tmp
        }
    }
}
