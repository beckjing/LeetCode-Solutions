import UIKit

class NumArray {
    
    var sums : [Int]?
    
    init(_ nums: [Int]) {
        let nCount = nums.count
        if nCount > 0 {
            self.sums = [Int](repeating: 0, count: nCount)
            self.sums![0] = nums[0]
            for i in 1..<nCount {
                self.sums![i] = self.sums![i - 1] + nums[i]
            }
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        if left == 0 {
            return self.sums![right]
        }
        return self.sums![right] - self.sums![left - 1]
    }
}
