import Cocoa

class Solution {
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        let nCount1 = nums1.count
        let nCount2 = nums2.count
        var f = [Int](repeating: 0, count: nCount1)
        while result.count < k {
            var cur = 0
            for i in 1..<nCount1 {
                if f[i] == nCount2 {
                    continue
                }
                
                if f[cur] == nCount2 || nums1[cur] + nums2[f[cur]] > nums1[i] + nums2[f[i]] {
                    cur = i
                }
            }
            if f[cur] == nCount2 {
                break
            }
            result.append([nums1[cur], nums2[f[cur]]])
            f[cur] += 1
        }
        return result
    }
}

Solution().kSmallestPairs([1,7,11], [2,4,6], 3)
