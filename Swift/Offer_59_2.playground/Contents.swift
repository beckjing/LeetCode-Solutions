import UIKit

class MaxQueue {
    
    var queue = [Int]()
    var maxQueue = [Int]()
    
    init() {
        
    }
    
    func max_value() -> Int {
        if !self.maxQueue.isEmpty {
            return self.maxQueue.first!
        }
        return -1
    }
    
    func push_back(_ value: Int) {
        self.queue.append(value)
        while !self.maxQueue.isEmpty && self.maxQueue.last! < value {
            self.maxQueue.popLast()
        }
        self.maxQueue.append(value)
    }
    
    func pop_front() -> Int {
        if self.queue.isEmpty {
            return -1
        }
        if self.queue.first == self.maxQueue.first {
            self.maxQueue.removeFirst()
        }
        return self.queue.removeFirst()
    }
}
