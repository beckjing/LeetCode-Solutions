import UIKit

class MyQueue {
    
    var stk1 = Array<Int>()
    var stk2 = Array<Int>()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        self.stk1.append(x)
    }
    
    func pop() -> Int {
        if self.stk2.isEmpty {
            while self.stk1.last != nil {
                stk2.append(stk1.popLast()!)
            }
        }
        return self.stk2.popLast()!
    }
    
    func peek() -> Int {
        if self.stk2.isEmpty == false {
            return self.stk2.last!
        }
        return self.stk1.first!
    }
    
    func empty() -> Bool {
        return self.stk1.isEmpty && self.stk2.isEmpty
    }
    
}
