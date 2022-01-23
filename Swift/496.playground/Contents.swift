import UIKit

class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stk = [Int]()
        var dic = Dictionary<Int, Int>()
        var result = [Int]()
        for num2 in nums2 {
            while stk.last != nil {
                if num2 > stk.last! {
                    dic[stk.popLast()!] = num2
                }
                else {
                    break
                }
            }
            stk.append(num2)
        }
        for n in stk {
            dic[n] = -1
        }
        for num1 in nums1 {
            result.append(dic[num1]!)
        }
        return result
    }
}
