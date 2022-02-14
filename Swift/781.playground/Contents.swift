import UIKit

class Solution {
    func numRabbits(_ answers: [Int]) -> Int {
        let sorted = answers.sorted()
        var sum = 0
        var remain = 0
        var current = 0
        for sort in sorted {
            if sort == 0 {
                sum += 1
            }
            else {
                if current >= sort && remain > 0 {
                    remain -= 1
                }
                else {
                    current = sort
                    remain = sort
                    sum += sort + 1
                }
            }
        }
        return sum
    }
}
