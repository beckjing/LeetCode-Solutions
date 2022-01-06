import UIKit

class Solution {
    
    let Draw = 0
    let Mwin = 1
    let Cwin = 2
    
    var graph: [[Int]]?
    var dp: [[[Int]]]?
    var gCount: Int?
    
    func catMouseGame(_ graph: [[Int]]) -> Int {
        self.gCount = graph.count
        self.graph = graph
        self.dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 2 * self.gCount!), count: self.gCount!), count: self.gCount!)
        return self.getResult(mouse: 1, cat: 2, turns: 0)
    }
    
    func getResult(mouse: Int, cat: Int, turns: Int) -> Int {
        if turns == self.gCount! * 2 {
            return Draw
        }
        var res = self.dp![mouse][cat][turns]
        if res != -1 {
            return res
        }
        if mouse == 0 {
            return Mwin
        }
        else if cat == mouse {
            return Cwin
        }
        else {
            res = getNextResult(mouse: mouse, cat: cat, turns: turns)
        }
        self.dp![mouse][cat][turns] = res
        return res
    }
    
    func getNextResult(mouse: Int, cat: Int, turns: Int) -> Int {
        let mouseMove = turns % 2 == 0
        let curMove = mouseMove ? mouse : cat
        let defaultRes = mouseMove ? Cwin : Mwin
        var res = defaultRes
        var nextM: Int?
        var nextC: Int?
        var nextRes: Int?
        for next in self.graph![curMove] {
            if mouseMove == false && next == 0 {
                continue
            }
            nextM = mouseMove ? next : mouse
            nextC = mouseMove ? cat : next
            nextRes = self.getResult(mouse: nextM!, cat: nextC!, turns: turns + 1)
            if nextRes != defaultRes {
                res = nextRes!
                if res != Draw {
                    break
                }
            }
        }
        return res
    }
}

Solution().catMouseGame([[3,4],[3,5],[3,6],[0,1,2],[0,5,6],[1,4],[2,4]])
