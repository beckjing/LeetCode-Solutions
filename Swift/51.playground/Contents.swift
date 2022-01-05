import Cocoa

class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result = [[String]]()
        var queens = Array<Int>(repeating: -1, count: n)
        var columns = Set<Int>()
        var diagonals1 = Set<Int>()
        var diagonals2 = Set<Int>()
        backTrace(result: &result, queens: &queens, n: n, row: 0, columns: &columns, diagonals1: &diagonals1, diagonals2: &diagonals2)
        return result
    }
    
    func backTrace(result: inout [[String]], queens: inout [Int], n: Int, row: Int, columns: inout Set<Int>, diagonals1: inout Set<Int>, diagonals2: inout Set<Int>) {
        if row == n {
            let sol = solution(queens: queens, n: n)
            result.append(sol)
        }
        else {
            for i in 0..<n {
                if columns.contains(i) {
                    continue
                }
                let diagonal1 = row - i
                if diagonals1.contains(diagonal1) {
                    continue
                }
                let diagonal2 = row + i
                if diagonals2.contains(diagonal2) {
                    continue
                }
                queens[row] = i
                columns.insert(i)
                diagonals1.insert(diagonal1)
                diagonals2.insert(diagonal2)
                backTrace(result: &result, queens: &queens, n: n, row: row + 1, columns: &columns, diagonals1: &diagonals1, diagonals2: &diagonals2)
                queens[row] = -1
                columns.remove(i)
                diagonals1.remove(diagonal1)
                diagonals2.remove(diagonal2)
            }
        }
    }
    
    func solution(queens: [Int], n: Int) -> [String] {
        var solution = [String]()
        for queen in queens {
            var row = ""
            row += String(repeating: ".", count: queen)
            row += "Q"
            row += String(repeating: ".", count: n - queen - 1)
            solution.append(row)
        }
        return solution
    }
}
