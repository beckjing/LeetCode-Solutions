import UIKit

class Solution {
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        if nums.count <= 2 {
            return 1
        }
        var judge = [Int]()
        for i in 0..<nums.count - 1 {
            judge.append(nums[i + 1] - nums[i])
        }
        var result = 1
        var status = 0
        for j in judge {
            if j * status < 0 {
                result += 1
                status = -status
            }
            else if j * status == 0 {
                if status == 0 && j != 0 {
                    if j > 0 {
                        status = 1
                    }
                    else {
                        status = -1
                    }
                    result += 1
                }
            }
        }
        return result
    }
}
