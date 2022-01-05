import Cocoa

class Trie {
    
    var children = Array<Trie?>(repeating: nil, count: 26)
    var isEnd = false
    
    init() {
        
    }
    
    func insert(_ word: String) {
        var node = self
        for ch in word.unicodeScalars {
            let index = Int(ch.value - "a".unicodeScalars.first!.value)
            if node.children[index] == nil {
                node.children[index] = Trie()
            }
            node = node.children[index]!
        }
        node.isEnd = true
    }
    
    
    func searchPrefix(_ word: String) -> Trie? {
        var node = self
        for ch in word.unicodeScalars {
            let index = Int(ch.value - "a".unicodeScalars.first!.value)
            if node.children[index] == nil {
                return nil
            }
            node = node.children[index]!
        }
        return node
    }
    
    
    func search(_ word: String) -> Bool {
        let node = self.searchPrefix(word)
        return node != nil && node!.isEnd == true
    }
    
    func startsWith(_ prefix: String) -> Bool {
        return self.searchPrefix(prefix) != nil
    }
}
