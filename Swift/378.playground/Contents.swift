import UIKit

class Solution {
    
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let n = matrix.count
        var left = matrix[0][0]
        var right = matrix[n - 1][n - 1]
        while left < right {
            let mid = left + (right - left) / 2
            if check(matrix, mid, k) {
                right = mid
            }
            else {
                left = mid + 1
            }
        }
        return left
    }
    
    func check(_ matrix: [[Int]], _ mid: Int, _ k: Int) -> Bool {
        let n = matrix.count
        var i = n - 1
        var j = 0
        var num = 0
        while i >= 0 && j < n {
            if matrix[i][j] <= mid {
                num += i + 1
                j += 1
            }
            else {
                i -= 1
            }
        }
        return num >= k
    }
}

print(Solution().kthSmallest([[1,3,5],[6,7,12],[11,14,14]], 5))
