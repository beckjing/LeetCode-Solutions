import UIKit

class Solution {
    func simplifyPath(_ path: String) -> String {
        let pathArr = path.split(separator: "/")
        var pathStk = Array<String>()
        var result = "/"
        
        for subpath in pathArr {
            if subpath.count > 0 {
                if subpath.elementsEqual("..") {
                    pathStk.popLast()
                }
                else if subpath.elementsEqual(".") {
                    
                }
                else {
                    pathStk.append(String(subpath))
                }
            }
        }
        result += pathStk.joined(separator: "/")
        return result
    }
}
