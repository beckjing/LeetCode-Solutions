import UIKit

class Solution {
    
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        return allPathsSourceTarget_inner(graph, 0)
    }
    
    func allPathsSourceTarget_inner(_ graph: [[Int]], _ start: Int) -> [[Int]] {
        let end = graph.count - 1
        var result = [[Int]]()
        let nextPoints = graph[start]
        for nextP in nextPoints {
            if nextP == end {
                result.append([start, nextP])
            }
            else {
                let nextPaths = allPathsSourceTarget_inner(graph, nextP)
                if nextPaths.count > 0 {
                    for nextPath in nextPaths {
                        var tmp = [start]
                        tmp.append(contentsOf: nextPath)
                        result.append(tmp)
                    }
                }
            }
        }
        return result
    }
}
