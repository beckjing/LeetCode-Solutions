import UIKit

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var result = image
        self.fill(image: &result, sr: sr, sc: sc, sourceColor: image[sr][sc], newColor: newColor)
        return result
    }
    
    func fill(image: inout [[Int]], sr: Int, sc: Int, sourceColor: Int, newColor: Int) {
        if sr < 0 || sr >= image.count {
            return
        }
        if sc < 0 || sc >= image[0].count {
            return
        }
        if image[sr][sc] != sourceColor || image[sr][sc] == newColor {
            return
        }
        image[sr][sc] = newColor
        self.fill(image: &image, sr: sr - 1, sc: sc, sourceColor: sourceColor, newColor: newColor)
        self.fill(image: &image, sr: sr + 1, sc: sc, sourceColor: sourceColor, newColor: newColor)
        self.fill(image: &image, sr: sr, sc: sc - 1, sourceColor: sourceColor, newColor: newColor)
        self.fill(image: &image, sr: sr, sc: sc + 1, sourceColor: sourceColor, newColor: newColor)
    }
}

print(Solution().floodFill([[0,0,0],[0,1,1]], 1, 1, 1))
