import UIKit

class Solution {
    func sumNums(_ n: Int) -> Int {
        return Array(1...n).reduce(0) { partialResult, item in
            return partialResult + item
        }
    }
}
