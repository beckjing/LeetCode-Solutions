import UIKit

class MinStack {
    
    var vStk = Array<Int>()
    var mStk = Array<Int>()
    
    init() {
        mStk.append(Int.max)
    }
    
    func push(_ val: Int) {
        vStk.append(val)
        if val < mStk.last! {
            mStk.append(val)
        }
        else {
            mStk.append(mStk.last!)
        }
    }
    
    func pop() {
        vStk.popLast()
        mStk.popLast()
    }
    
    func top() -> Int {
        return vStk.last!
    }
    
    func getMin() -> Int {
        return mStk.last!
    }
}
