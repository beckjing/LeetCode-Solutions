import UIKit

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums1Dic = Dictionary<Int, Int>()
        for num1 in nums1 {
            if nums1Dic[num1] == nil {
                nums1Dic[num1] = 0
            }
            nums1Dic[num1]! += 1
        }
        var result = [Int]()
        for num2 in nums2 {
            if nums1Dic[num2] != nil && nums1Dic[num2]! > 0 {
                result.append(num2)
                nums1Dic[num2]! -= 1
            }
        }
        return result
    }
}
