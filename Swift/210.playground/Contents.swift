import UIKit

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        if numCourses == 1 {
            return [0]
        }
        var dic = Dictionary<Int, Set<Int>>()
        for i in 0..<numCourses {
            dic[i] = Set<Int>()
        }
        var result = [Int]()
        for prerequisite in prerequisites {
            dic[prerequisite.first!]!.insert(prerequisite.last!)
        }
        var stk = [Int]()
        for (key, value) in dic {
            if value.count == 0 {
                result.append(key)
            }
            else {
                stk.append(key)
            }
        }
        while stk.count > 0 {
            var tmp = [Int]()
            let courseSet = Set<Int>(result)
            var learned = false
            for key in stk {
                if dic[key]!.isSubset(of: courseSet) {
                    result.append(key)
                    learned = true
                }
                else {
                    tmp.append(key)
                }
            }
            if learned == false {
                return []
            }
            stk = tmp
        }
        
        return result
    }
}

Solution().findOrder(2, [[1, 0]])
