import Cocoa

class Solution {
    
    let size = 1000000
    
    func isEscapePossible(_ blocked: [[Int]], _ source: [Int], _ target: [Int]) -> Bool {
        var blockedMap = Dictionary<String, Bool>()
        
        let max = blocked.count * (blocked.count - 1) / 2
        for block in blocked {
            blockedMap["\(block.first!)_\(block.last!)"] = true
        }
        var searched = Dictionary<String, Bool>()
        var reverseSearched = Dictionary<String, Bool>()
        return search(blockedMap: &blockedMap, searched: &searched, source: source, target: target, remainCount: max) && search(blockedMap: &blockedMap, searched: &reverseSearched, source: target, target: source, remainCount: max)
    }
    
    func search(blockedMap: inout Dictionary<String, Bool>, searched: inout Dictionary<String, Bool>, source: [Int], target: [Int], remainCount: Int) -> Bool {
        if remainCount == -1 {
            return true
        }
        if source.first! == target.first! && source.last! == target.last! {
            return true
        }
        let lastKey = "\(source.first!)_\(source.last!)"
        let lastX = source.first!
        let lastY = source.last!
        if blockedMap[lastKey] != true && searched[lastKey] != true {
            searched[lastKey] = true
            if lastX > 0 {
                if search(blockedMap: &blockedMap, searched: &searched, source: [lastX - 1, lastY], target: target, remainCount: remainCount - 1) {
                    return true
                }
            }
            if lastX < size - 1 {
                if search(blockedMap: &blockedMap, searched: &searched, source: [lastX + 1, lastY], target: target, remainCount: remainCount - 1) {
                    return true
                }
            }
            if lastY > 0 {
                if search(blockedMap: &blockedMap, searched: &searched, source: [lastX, lastY - 1], target: target, remainCount: remainCount - 1) {
                    return true
                }
            }
            if lastY < size - 1 {
                if search(blockedMap: &blockedMap, searched: &searched, source: [lastX, lastY + 1], target: target, remainCount: remainCount - 1) {
                    return true
                }
            }
        }
        return false
    }
}

Solution().isEscapePossible([[0,3],[1,0],[1,1],[1,2],[1,3]], [0, 0], [0, 2])
