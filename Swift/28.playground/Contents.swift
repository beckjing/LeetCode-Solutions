import Cocoa

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        var nArr = Array<Character>()
        for n in needle {
            nArr.append(n)
        }
        let nCount = nArr.count
        if nCount == 0 {
            return 0
        }
        var hArr = Array<Character>()
        for h in haystack {
            hArr.append(h)
        }
        let hCount = hArr.count
        if hCount == 0 {
            return -1
        }
        var nNext = Array<Int>(repeating: 0, count: nArr.count)
        for i in 1..<nCount {
            if nArr[i] == nArr[nNext[i - 1]] {
                nNext[i] = nNext[i - 1] + 1
            }
            else {
                var index = i
                while index > 0 {
                    index = nNext[index - 1]
                    if nArr[i] == nArr[index] {
                        nNext[i] = index + 1
                        break
                    }
                }
            }
        }
        var nIndex = 0
        print(nNext)
        for j in 0..<hCount {
            if hArr[j] == nArr[nIndex] {
                nIndex += 1
            }
            else {
                while nIndex > 0 {
                    nIndex = nNext[nIndex - 1]
                    if hArr[j] == nArr[nIndex] {
                        nIndex += 1
                        break
                    }
                }
            }
            if nIndex == nCount {
                return j - nCount + 1
            }
        }
        return -1
    }
}

Solution().strStr("ababcaababcaabc", "ababcaabc")
