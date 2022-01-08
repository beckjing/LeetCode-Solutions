import UIKit

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var k = 0
        let nCount = nums.count
        if nCount == 1 {
            if nums.first == target {
                return 0
            }
        }
        else {
            for i in 1..<nCount {
                if nums[nCount - i - 1] > nums[nCount - i] {
                    k = i
                    break
                }
            }
            if target < nums[(nCount - k) % nCount] || target > nums[nCount - k - 1] {
                return -1
            }
            
            if target >= nums.first! {
                var start = 0
                var end = nCount - k - 1
                while start <= end {
                    let middle = (start + end) / 2
                    if nums[middle] < target {
                        start = middle + 1
                    }
                    else if nums[middle] > target {
                        end = middle - 1
                    }
                    else {
                        return middle
                    }
                }
            }
            else if target <= nums.last! {
                var start = nCount - k
                var end = nCount - 1
                while start <= end {
                    let middle = (start + end) / 2
                    if nums[middle] < target {
                        start = middle + 1
                    }
                    else if nums[middle] > target {
                        end = middle - 1
                    }
                    else {
                        return middle
                    }
                }
            }
        }
        return -1
    }
}

Solution().search([4,5,6,7,0,1,2], 0)
