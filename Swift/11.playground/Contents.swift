import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var width = height.count - 1
        var maxArea = 0
        while width > 0 {
            if height[left] < height[left + width] {
                let area = height[left] * width
                maxArea = maxArea > area ? maxArea : area
                left += 1
            }
            else {
                let area = height[left + width] * width
                maxArea = maxArea > area ? maxArea : area
            }
            width -= 1
        }
        return maxArea
    }
}
