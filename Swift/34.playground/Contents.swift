import UIKit

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var start = 0
        var end = nums.count - 1
        if end < 0 {
            return [-1, -1]
        }
        while start < end {
            let middle = (start + end) / 2
            if nums[middle] < target {
                start = middle + 1
            }
            else if nums[middle] > target {
                end = middle - 1
            }
            else {
                var leftMiddle = middle
                var rightMiddle = middle
                while start < leftMiddle {
                    print(start)
                    let lMiddle = (start + leftMiddle) / 2
                    if nums[lMiddle] < target {
                        start = lMiddle + 1
                    }
                    else {
                        if nums[start] < target {
                            start += 1
                        }
                        else {
                            break
                        }
                        if nums[lMiddle - 1] == target {
                            leftMiddle = lMiddle - 1
                        }
                    }
                }
                while end > rightMiddle {
                    let rMiddle = (end + rightMiddle) / 2
                    if nums[rMiddle] > target {
                        end = rMiddle - 1
                    }
                    else {
                        if nums[end] > target {
                            end -= 1
                        }
                        else {
                            break
                        }
                        if nums[rMiddle + 1] == target {
                            rightMiddle = rMiddle + 1
                        }
                    }
                }
                break
            }
        }
        if nums[start] != target || nums[end] != target {
            return [-1, -1]
        }
        return [start, end]
    }
}

Solution().searchRange([5,7,7,8,8,10], 8)
