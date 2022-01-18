import Cocoa

class Solution {
    func replaceSpace(_ s: String) -> String {
        var result = ""
        for char in s {
            if char == " " {
                result += "%20"
            }
            else {
                result += String(char)
            }
        }
        return result
    }
}
