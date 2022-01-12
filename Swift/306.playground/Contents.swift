import Cocoa

class Solution {
    func isAdditiveNumber(_ num: String) -> Bool {
        let nCount = num.count
        if nCount <= 2 {
            return false
        }
        var nArr = Array<Character>()
        for char in num {
            nArr.append(char)
        }
        for i in 0...nCount - 3 {
            var first = ""
            for f in 0...i {
                first.append(nArr[f])
            }
            if first.first! == "0" && first.count > 1 {
                continue
            }
            for j in (i + 1)...nCount - 2 {
                var second = ""
                for s in (i + 1)...j {
                    second += String(nArr[s])
                }
                if second.first! == "0" && second.count > 1 {
                    continue
                }
                var third = String(Int(first)! + Int(second)!)
                var testFirst = first
                var testSecond = second
                var testThird = ""
                var thirdIndex = j + 1
                while (thirdIndex + third.count) <= nCount {
                    for t in thirdIndex..<(thirdIndex + third.count) {
                        testThird += String(nArr[t])
                    }
                    if (testThird.first! == "0" && testThird.count > 1) || third != testThird {
                        break
                    }
                    if thirdIndex + third.count == nCount {
                        return true
                    }
                    thirdIndex = thirdIndex + third.count
                    testFirst = testSecond
                    testSecond = third
                    third = String(Int(testFirst)! + Int(testSecond)!)
                    testThird = ""
                }
                
            }
        }
        return false
    }
}

Solution().isAdditiveNumber("111122335588143")
