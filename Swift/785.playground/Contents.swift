import UIKit


class Solution {
    
    enum Color {
        case Uncolored
        case Red
        case Blue
    }
    
    var gColor: [Color]?
    
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let gCount = graph.count
        self.gColor = [Color](repeating: .Uncolored, count: gCount)
        for i in 0..<gCount {
            if self.gColor![i] == .Uncolored {
                if dfs(graph, i, .Red) == false {
                    return false
                }
            }
        }
        return true
    }
    
    func dfs(_ graph: [[Int]], _ index: Int, _ color: Color) -> Bool {
        if self.gColor![index] == color {
            return true
        }
        else if self.gColor![index] == .Uncolored {
            self.gColor![index] = color
            var targetC: Color = .Uncolored
            if color == .Red {
                targetC = .Blue
            }
            else {
                targetC = .Red
            }
            for node in graph[index] {
                if dfs(graph, node, targetC) == false {
                    return false
                }
            }
            return true
        }
        return false
    }
}

print(Solution().isBipartite([[1,3],[0,2],[1,3],[0,2]]))
