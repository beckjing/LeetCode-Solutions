import UIKit

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        let nCount = nums.count
        if nCount == 1 {
            return nums.first == target
        }
        var start = 0
        var end = nCount - 1
        while start < end {
            let middle = start + (end - start) / 2
            if nums[middle] > nums[end] {
                start = middle + 1
            }
            else if nums[middle] < nums[end] {
                if nums[end] > nums[start] {
                    start = end + 1
                }
                else {
                    end = middle
                }
            }
            else {
                end -= 1
            }
        }
        if target < nums[start] {
            return false
        }
        else if target <= nums[nCount - 1] {// start ~ end
            end = nCount - 1
        }
        else if target > nums[nCount - 1] {// 0 ~ start - 1
            if start - 1 < 0 {
                return false
            }
            end = start - 1
            start = 0
        }
        return search(Array(nums[start...end]), target)
    }
    
    func search_inner(_ nums: [Int], _ target: Int) -> Bool {
        let nCount = nums.count
        var start = 0
        var end = nCount - 1
        while start < end {
            let middle = start + (end - start) / 2
            print(start, middle, end)
            if nums[middle] < target {
                start = middle + 1
            }
            else if nums[middle] > target {
                end = middle - 1
            }
            else {
                return true
            }
        }
        return nums[start] == target
    }
}

Solution().search([1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1], 2)

//输入：nums = [2,5,6,0,0,1,2], target = 0
//输出：true
