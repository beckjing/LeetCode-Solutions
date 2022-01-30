import UIKit

class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        let sortedP = people.sorted(by: { p1, p2 in
            if p1.first! > p2.first! {
                return true
            }
            if p1.first! == p2.first! {
                return p1.last! < p2.last!
            }
            return false
        })
        for people in sortedP {
            result.insert(people, at: people.last!)
        }
        return result
    }
}


print(Solution().reconstructQueue([[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]]))
