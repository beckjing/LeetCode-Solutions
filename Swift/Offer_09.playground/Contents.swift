import UIKit

class CQueue {
    
    var stk1 = Array<Int>()
    var stk2 = Array<Int>()
    
    init() {
        
    }
    
    func appendTail(_ value: Int) {
        self.stk1.append(value)
    }
    
    func deleteHead() -> Int {
        if self.stk2.last == nil {
            while self.stk1.last != nil {
                self.stk2.append(self.stk1.popLast()!)
            }
        }
        if self.stk2.last != nil {
            return self.stk2.popLast()!
        }
        return -1
    }
}
