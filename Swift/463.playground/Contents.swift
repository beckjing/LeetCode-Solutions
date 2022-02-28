import UIKit

class Solution {
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let row = grid.count
        let column = grid.first!.count
        var travel = [[Bool]](repeating: [Bool](repeating: false, count: column), count: row)
        return islandPerimeter(grid, &travel)
    }
    func islandPerimeter(_ grid: [[Int]], _ travel: inout [[Bool]]) -> Int {
        var result = 0
        
        
        return result
    }
}
