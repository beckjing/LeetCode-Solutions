import UIKit

class Solution {
    
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        var result = 0
        var dic1 = Dictionary<Int, Int>()
        var dic2 = Dictionary<Int, Int>()
        for num1 in nums1 {
            for num2 in nums2 {
                if dic1[num1 + num2] == nil {
                    dic1[num1 + num2] = 0
                }
                dic1[num1 + num2]! += 1
            }
        }
        for num3 in nums3 {
            for num4 in nums4 {
                if dic2[num3 + num4] == nil {
                    dic2[num3 + num4] = 0
                }
                dic2[num3 + num4]! += 1
            }
        }
        for key in dic1.keys {
            if dic2[-key] != nil {
                result += dic1[key]! * dic2[-key]!
            }
        }
        return result
    }
}
