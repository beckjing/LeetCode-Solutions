import UIKit

public class Employee {
    public var id: Int
    public var importance: Int
    public var subordinates: [Int]
    public init(_ id: Int, _ importance: Int, _ subordinates: [Int]) {
        self.id = id
        self.importance = importance
        self.subordinates = subordinates
    }
}


class Solution {
    func getImportance(_ employees: [Employee], _ id: Int) -> Int {
        var dic = Dictionary<Int, Employee>()
        for employee in employees {
            dic[employee.id] = employee
        }
        let boss = dic[id]!
        var result = 0
        var stk = [Employee]()
        stk.append(boss)
        while stk.count > 0 {
            var tmp = [Employee]()
            for emp in stk {
                result += emp.importance
                for empId in emp.subordinates {
                    tmp.append(dic[empId]!)
                }
            }
            stk = tmp
        }
        return result
    }
}
