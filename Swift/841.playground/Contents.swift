import UIKit

class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        let rCount = rooms.count
        var remain = rCount - 1
        var canUnlock = [Bool](repeating: false, count: rCount)
        canUnlock[0] = true
        var stk = [Int]()
        stk.append(0)
        while stk.count > 0 {
            var tmp = [Int]()
            for room in stk {
                for key in rooms[room] {
                    if canUnlock[key] == false {
                        canUnlock[key] = true
                        tmp.append(key)
                        remain -= 1
                    }
                }
            }
            stk = tmp
        }
        return remain == 0
    }
}
