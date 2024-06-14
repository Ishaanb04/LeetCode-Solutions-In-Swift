// 304. Range Sum Query 2D - Immutable
// https://leetcode.com/problems/range-sum-query-2d-immutable/description/

class NumMatrix {
    let matrix: [[Int]]
    var prefixMatrix: [[Int]]
    init(_ matrix: [[Int]]) {
        self.matrix = matrix
        self.prefixMatrix = matrix
        computePrefixMatrix()
    }
    
    private func computePrefixMatrix() {
        let rows = matrix.count
        let cols = matrix[0].count
        
        for r in 0 ..< rows {
            for c in 0 ..< cols {
                let top = r - 1 < 0 ? 0 : prefixMatrix[r - 1][c]
                let left = c - 1 < 0 ? 0 : prefixMatrix[r][c - 1]
                let topLeft = min(r - 1, c - 1) < 0 ? 0 : prefixMatrix[r - 1][c - 1]
                prefixMatrix[r][c] = prefixMatrix[r][c] + top + left - topLeft
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        let top = row1 - 1 < 0 ? 0 : prefixMatrix[row1 - 1][col2]
        let left = col1 - 1 < 0 ? 0 : prefixMatrix[row2][col1 - 1]
        let topLeft = min(row1 - 1, col1 - 1) < 0 ? 0 : prefixMatrix[row1 - 1][col1 - 1]
        return prefixMatrix[row2][col2] - top - left + topLeft
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
