import UIKit

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        if n == 0 {
            return true
        }
        if flowerbed.count <= 2 {
            return flowerbed.first! == 0 && flowerbed.last! == 0 && n == 1
        }
        var remain = n
        var fBed = flowerbed
        let fCount = fBed.count
        var index = 0
        while index < fCount {
            if index == 0 {
                if fBed[0] == 0 && fBed[1] == 0 {
                    remain -= 1
                    fBed[0] = 1
                }
            }
            else if index == fCount - 1 {
                if fBed[fCount - 1] == 0 && fBed[fCount - 2] == 0 {
                    remain -= 1
                    fBed[fCount - 1] = 1
                }
            }
            else {
                if fBed[index - 1] == 0 && fBed[index] == 0 && fBed[index + 1] == 0 {
                    remain -= 1
                    fBed[index] = 1
                }
            }
            index += 1
        }
        return remain <= 0
    }
}
