import Cocoa

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let pCount = p.count
        let sCount = s.count
        var result = Array<Int>()
        if pCount > sCount {
            return result
        }
        var sArr = Array<Character>()
        for char in s {
            sArr.append(char)
        }
        var checkDic = Dictionary<Character, Int>()
        for char in p {
            if checkDic[char] == nil {
                checkDic[char] = 1
            }
            else {
                checkDic[char]! += 1
            }
        }
        var currentDic = Dictionary<Character, Int>()
        var start = 0
        var end = pCount - 1
        for i in start..<end {
            if currentDic[sArr[i]] == nil {
                currentDic[sArr[i]] = 1
            }
            else {
                currentDic[sArr[i]]! += 1
            }
        }
        while end < sCount {
            if currentDic[sArr[end]] == nil {
                currentDic[sArr[end]] = 1
            }
            else {
                currentDic[sArr[end]]! += 1
            }
            if checkDic == currentDic {
                result.append(start)
            }
            if currentDic[sArr[start]] == 1 {
                currentDic.removeValue(forKey: sArr[start])
            }
            else {
                currentDic[sArr[start]]! -= 1
            }
            start += 1
            end += 1
        }
        return result
    }
}

Solution().findAnagrams("abaacbabc", "abc")
