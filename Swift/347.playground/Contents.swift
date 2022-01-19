import UIKit

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var result = [Int]()
        var dicSet = Dictionary<Int, Set<Int>>()
        var dicCount = Dictionary<Int, Int>()
        for num in nums {
            if dicCount[num] == nil {
                dicCount[num] = 1
                if dicSet[1] == nil {
                    dicSet[1] = Set<Int>()
                }
                dicSet[1]!.insert(num)
            }
            else {
                let origin = dicCount[num]!
                dicCount[num]! += 1
                dicSet[origin]?.remove(num)
                if dicSet[origin + 1] == nil {
                    dicSet[origin + 1] = Set<Int>()
                }
                dicSet[origin + 1]?.insert(num)
            }
        }
        let dicSetKeys = dicSet.keys
        for key in dicSetKeys.sorted().reversed() {
            result.append(contentsOf: dicSet[key]!)
            if result.count == k {
                break
            }
        }
        return result
    }
}
