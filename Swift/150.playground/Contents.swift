import UIKit

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stk = Array<Int>()
        for token in tokens {
            if token.last!.isNumber {
                stk.append(Int(token)!)
            }
            else {
                if token.first == "+" {
                    let num2 = stk.popLast()!
                    let num1 = stk.popLast()!
                    stk.append(num1 + num2)
                }
                else if token.first == "-" {
                    let num2 = stk.popLast()!
                    let num1 = stk.popLast()!
                    stk.append(num1 - num2)
                }
                else if token.first == "*" {
                    let num2 = stk.popLast()!
                    let num1 = stk.popLast()!
                    stk.append(num1 * num2)
                }
                else if token.first == "/" {
                    let num2 = stk.popLast()!
                    let num1 = stk.popLast()!
                    stk.append(num1 / num2)
                }
            }
        }
        return stk.last!
    }
}
