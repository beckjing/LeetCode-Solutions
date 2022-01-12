import Cocoa

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        let nCount = nums.count
        if nCount == 1 || k == 0 {
            return false
        }
        var checkDic = Dictionary<Int, Int>()
        if k >= nCount {
            for i in 0..<nCount {
                if checkDic[nums[i]] == nil {
                    checkDic[nums[i]] = 1
                }
                else {
                    return true
                }
            }
            return false
        }
        else {
            for i in 0...k {
                if checkDic[nums[i]] == nil {
                    checkDic[nums[i]] = 1
                }
                else {
                    return true
                }
            }
            for i in 0..<(nCount - k - 1) {
                if checkDic[nums[i]] == 1 {
                    checkDic.removeValue(forKey: nums[i])
                }
                else {
                    print(i)
                    print(checkDic)
                    checkDic[nums[i]]! -= 1
                }
                if checkDic[nums[i + k + 1]] == nil {
                    checkDic[nums[i + k + 1]] = 1
                }
                else {
                    return true
                }
            }
        }
        return false
    }
}

Solution().containsNearbyDuplicate([1,2,3,4,5,6,7,8,9,9], 3)
