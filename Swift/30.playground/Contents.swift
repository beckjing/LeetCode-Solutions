import Cocoa

class Solution {
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        var checkDic = Dictionary<String, Int>()
        let size = words.count * words.first!.count
        let sSize = s.count
        var result = [Int]()
        if sSize < size {
            return result
        }
        
        for word in words {
            if checkDic[word] == nil {
                checkDic[word] = 1
            }
            else {
                checkDic[word]! += 1
            }
        }
        var testString = ""
        var testCount = 0
        var i = 0
        for char in s {
            testString.append(char)
            testCount += 1
            if testCount == size {
                if check(s: testString, checkDic: checkDic, size: words.first!.count) {
                    result.append(i - size + 1)
                }
                testString.removeFirst()
                testCount -= 1
            }
            i += 1
        }
        return result
    }
    
    func check(s: String, checkDic: Dictionary<String, Int>, size: Int) -> Bool {
        var checkDicC = checkDic
        var testString = ""
        var testCount = 0
        for char in s {
            testString.append(char)
            testCount += 1
            if testCount == size {
                var subCount = checkDicC[testString]
                if subCount != nil {
                    subCount! -= 1
                    if subCount == 0 {
                        checkDicC.removeValue(forKey: testString)
                    }
                    else {
                        checkDicC[testString]! -= 1
                    }
                }
                else {
                    return false
                }
                testString.removeAll()
                testCount = 0
            }
        }
        return true
    }
}

print(Solution().findSubstring("wordgoodgoodgoodbestword", ["word","good","best","good"]))
