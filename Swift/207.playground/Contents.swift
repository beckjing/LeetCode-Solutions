import UIKit

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var courseArr = Array<Set>(repeating: Set<Int>(), count: numCourses)
        for prerequisite in prerequisites {
            courseArr[prerequisite.last!].insert(prerequisite.first!)
        }
        var courseS = Set<Int>()
        var newCourse = true
        while newCourse {
            var tmp = false
            for i in 0..<courseArr.count {
                if courseS.contains(i) {
                    
                }
                else if courseArr[i].count == 0 || courseArr[i].isSubset(of: courseS) {
                    courseArr[i].removeAll()
                    courseS.insert(i)
                    tmp = true
                }
            }
            newCourse = tmp
        }
        return courseS.count == numCourses
    }
}
