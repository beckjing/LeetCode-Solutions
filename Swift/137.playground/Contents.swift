import UIKit

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dic = Dictionary<Int, Int>()
        for num in nums {
            if dic[num] == nil {
                dic[num] = 2
            }
            else {
                dic[num]! -= 1
                if dic[num] == 0 {
                    dic.removeValue(forKey: num)
                }
            }
        }
        return dic.keys.first!
    }
}
