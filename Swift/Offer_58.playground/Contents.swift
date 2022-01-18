import Cocoa

class Solution {
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        var result = ""
        let k = n % s.count
        result += String(s[s.index(s.startIndex, offsetBy: k)..<s.index(s.startIndex, offsetBy: s.count)])
        result += String(s[s.index(s.startIndex, offsetBy: 0)..<s.index(s.startIndex, offsetBy: k)])
        return result
    }
}
