import UIKit

class Solution {
    
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        let sortedP = points.sorted { p1, p2 in
            return (p1.first! * p1.first! + p1.last! * p1.last!) < (p2.first! * p2.first! + p2.last! * p2.last!)
        }
        return [[Int]](sortedP[0..<k])
    }
    
}
