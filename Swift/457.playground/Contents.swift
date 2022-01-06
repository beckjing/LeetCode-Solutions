import UIKit

class Solution {
     
    var nums: [Int]?
    var nCount: Int?
    func circularArrayLoop(_ nums: [Int]) -> Bool {
        self.nums = nums
        self.nCount = nums.count
        var slow = 0
        var fast = nextNum(cur: 0)
        for index in 0..<self.nCount! {
            if self.nums![index] == 0 {
                continue
            }
            slow = index
            fast = nextNum(cur: index)
            print(slow)
            print(fast)
            while self.nums![slow] * self.nums![fast] > 0 && self.nums![slow] * self.nums![nextNum(cur: fast)] > 0 {
                if slow == fast {
                    if slow == nextNum(cur: slow) {
                        break
                    }
                    else {
                        return true
                    }
                }
                slow = nextNum(cur: slow)
                fast = nextNum(cur: nextNum(cur: fast))
            }
            var add = index
            while self.nums![add] * self.nums![nextNum(cur: add)] > 0 {
                let tmp = add
                add = nextNum(cur: add)
                self.nums![tmp] = 0
            }
        }
        return false
    }
    
    func nextNum(cur: Int) -> Int {
        let nextNum = (cur + self.nums![cur]) % self.nCount!
        if nextNum < 0 {
            return nextNum + self.nCount!
        }
        return nextNum
    }
}

Solution().circularArrayLoop([-1,2])
