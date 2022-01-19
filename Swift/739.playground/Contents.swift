import UIKit

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        if temperatures.count == 1 {
            return [0]
        }
        var result = [Int](repeating: 0, count: temperatures.count)
        var stk = Array<Int>()
        stk.append(0)
        for i in 1..<temperatures.count {
            while stk.last != nil && temperatures[stk.last!] < temperatures[i] {
                let last = stk.popLast()!
                result[last] = i - last
            }
            stk.append(i)
        }
        while stk.last != nil {
            let last = stk.popLast()!
            result[last] = 0
        }
        return result
    }
}
