// 799. Champagne Tower
// https://leetcode.com/problems/champagne-tower/description/

class Solution {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        guard poured > 0 else {return 0}
        var prevRow = [Double(poured)]

        for row in 1 ..< query_row + 1 {
            var currentRow = Array(repeating: 0.0, count: row + 1)
            for i in 0 ..< row {
                let extra = Double(prevRow[i] - 1)
                if extra > 0 {
                    currentRow[i] += 0.5 * extra
                    currentRow[i + 1] += 0.5 * extra
                }
            }
            prevRow = currentRow
        }
        return min(prevRow[query_glass], 1.0)
    }
}
