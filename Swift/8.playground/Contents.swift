import UIKit



class Solution {
    enum status {
        case space
        case pos
        case value
    }
    
    func myAtoi(_ s: String) -> Int {
        var result = 0
        var pos = 1
        var status = status.space
        for char in s {
            if char == " " && status == .space {
                continue
            }
            if (char == "+" || char == "-") && status == .space {
                pos = char == "+" ? 1 : -1
                status = .pos
                continue
            }
            let value = self.charToInt(char: char)
            if value == -1 {
                break
            }
            if status == .space || status == .pos {
                status = .value
            }
            result = result * 10 + value
            if result * pos > Int32.max {
                return Int(Int32.max)
            }
            else if result * pos < Int32.min {
                return Int(Int32.min)
            }
        }
        result *= pos
        return result
    }
    
    func charToInt(char: Character) -> Int {
        switch char {
            case "0":
                return 0
            case "1":
                return 1
            case "2":
                return 2
            case "3":
                return 3
            case "4":
                return 4
            case "5":
                return 5
            case "6":
                return 6
            case "7":
                return 7
            case "8":
                return 8
            case "9":
                return 9
            default:
                return -1
        }
    }
}
