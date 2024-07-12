// 542. 01 Matrix
// https://leetcode.com/problems/01-matrix/description/
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var mat = mat
        let rows = mat.count
        let cols = mat[0].count
        var queue = [Position]()
        var visited = Set<Position>()
        var currentDistance = 0
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        for row in 0 ..< rows {
            for col in 0 ..< cols {
                if mat[row][col] == 0 {
                    queue.append(.init(row, col))
                    visited.insert(.init(row, col))
                }
            }
        }

        while !queue.isEmpty {
            let queueLen = queue.count
            currentDistance += 1
            for _ in 0 ..< queueLen {
                let node = queue.removeFirst()

                for direction in directions {
                    bfs(node.row + direction.0,
                        node.col + direction.1, currentDistance)
                }
            }
        }

        func bfs(_ r: Int, _ c: Int, _ distance: Int) {
            guard min(r, c) >= 0, r < rows, c < cols,
                  mat[r][c] == 1, !visited.contains(.init(r, c)) else { return }
            visited.insert(.init(r, c))
            queue.append(.init(r, c))
            mat[r][c] = distance
        }

        return mat
    }
}

struct Position: Hashable {
    var row: Int
    var col: Int
    init(_ row: Int, _ col: Int) {
        self.row = row
        self.col = col
    }
}
