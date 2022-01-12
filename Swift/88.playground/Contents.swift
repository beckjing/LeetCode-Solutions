import Cocoa

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if n == 0 {
            return
        }
        var remain1 = m
        var remain2 = n
        var index = 0
        let nums1C = nums1[0..<m]
        while remain1 > 0 && remain2 > 0{
            let index1 = m - remain1
            let index2 = n - remain2
            let num1 = nums1C[index1]
            let num2 = nums2[index2]
            if num2 < num1 {
                nums1[index] = num2
                remain2 -= 1
            }
            else {
                nums1[index] = num1
                remain1 -= 1
            }
            index += 1
        }
        if remain1 > 0 {
            for i in 0..<remain1 {
                let index = m - remain1 + i
                nums1[n + index] = nums1C[index]
            }
        }
        else if remain2 > 0 {
            for i in 0..<remain2 {
                let index = n - remain2 + i
                nums1[m + index] = nums2[index]
            }
        }
    }
}

var nums1 = [2, 0]
var nums2 = [1]
Solution().merge(&nums1, 1, nums2, 1)
