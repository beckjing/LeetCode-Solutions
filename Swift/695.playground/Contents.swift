import UIKit

class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        let width = grid[0].count
        let height = grid.count
        var ans = 0
        var gridCopy = grid
        for x in 0..<height {
            for y in 0..<width {
                if grid[x][y] == 1 {
                    ans = max(calculate(grid: &gridCopy, x: x, y: y), ans)
                }
            }
        }
        return ans
    }
    
    func calculate(grid: inout [[Int]], x: Int, y: Int) -> Int {
        if x < 0 || x >= grid.count {
            return 0
        }
        if y < 0 || y >= grid[0].count {
            return 0
        }
        if grid[x][y] == 0 {
            return 0
        }
        var ans = 1
        grid[x][y] = 0
        ans += calculate(grid: &grid, x: x - 1, y: y)
        ans += calculate(grid: &grid, x: x + 1, y: y)
        ans += calculate(grid: &grid, x: x, y: y - 1)
        ans += calculate(grid: &grid, x: x, y: y + 1)
        return ans
    }
}

print(Solution().maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]))

