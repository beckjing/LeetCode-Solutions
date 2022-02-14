import UIKit

class Solution {
    
    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var result = [Int](repeating: 0, count: n)
        for booking in bookings {
            let start = booking[0] - 1
            let end = booking[1] - 1
            for i in start...end {
                result[i] += booking[2]
            }
        }
        return result
    }
    
}
