import Cocoa

class Solution {
    func merge(_ A: inout [Int], _ m: Int, _ B: [Int], _ n: Int) {
        var idxA = m - 1
        var idxB = n - 1
        while idxB >= 0 && idxA >= 0 {
            if B[idxB] >= A[idxA] {
                A[idxA + idxB + 1] = B[idxB]
                idxB -= 1
            }
            else {
                A[idxA + idxB + 1] = A[idxA]
                idxA -= 1
            }
        }
        if idxB >= 0 {
            for i in 0...idxB {
                A[i] = B[i]
            }
        }
    }
}
