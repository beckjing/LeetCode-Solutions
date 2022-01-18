import Cocoa

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let hCount = heights.count
        var right = [Int](repeating: 0, count: hCount)
        var left = [Int](repeating: 0, count: hCount)
        var stk = Array<Int>()
        for i in 0..<hCount {
            while stk.count > 0 && heights[stk.last!] >= heights[i] {
                stk.popLast()
            }
            left[i] = stk.count == 0 ? -1 : stk.last!
            stk.append(i)
        }
        stk.removeAll()
        for i in (0..<hCount).reversed() {
            while stk.count > 0 && heights[stk.last!] >= heights[i] {
                stk.popLast()
            }
            right[i] = stk.count == 0 ? hCount : stk.last!
            stk.append(i)
        }
        var ans = 0
        for i in 0..<hCount {
            ans = max(ans, (right[i] - left[i] - 1) * heights[i])
        }
        return ans
    }
}

Solution().largestRectangleArea([0, 9])
