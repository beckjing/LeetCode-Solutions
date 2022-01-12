import Cocoa

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var kArr = Array<Int>()
        kArr.append(nums.first!)
        let nCount = nums.count
        for i in 1..<nCount {
            let num = nums[i]
            let kCount = kArr.count
            if num > kArr.last! || kCount <= k  {
                var index = kCount - 1
                while index >= 0 && kArr[index] < num {
                    index -= 1
                }
                kArr.insert(num, at: index + 1)
                if kCount == k {
                    kArr.popLast()
                }
            }
        }
        return kArr[k - 1]
    }
}

Solution().findKthLargest([2, 1], 2)
