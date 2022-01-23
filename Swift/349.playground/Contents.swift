import UIKit

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var set1 = Set<Int>()
        var result = Set<Int>()
        for num1 in nums1 {
            set1.insert(num1)
        }
        for num2 in nums2 {
            if set1.contains(num2) {
                result.insert(num2)
            }
        }
        return Array(result)
    }
}
