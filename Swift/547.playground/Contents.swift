import UIKit

class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var isConnectedC = isConnected
        return findCircleNum_inner(&isConnectedC)
    }
    
    func findCircleNum_inner(_ isConnected: inout [[Int]]) -> Int {
        let cCount = isConnected.count
        var result = 0
        for i in 0..<cCount {
            for j in 0..<cCount {
                if isConnected[i][j] == 1 {
                    result += 1
                    deleteConnect(&isConnected, city: i)
                    if i != j {
                        deleteConnect(&isConnected, city: j)
                    }
                }
            }
        }
        return result
    }
    
    func deleteConnect(_ isConnected: inout [[Int]], city: Int) {
        let cCount = isConnected.count
        for i in 0..<cCount {
            if isConnected[city][i] == 1 {
                isConnected[city][i] = 0
                isConnected[i][city] = 0
                if i != city {
                    deleteConnect(&isConnected, city: i)
                }
            }
        }
    }
}
