// 994. Rotting Oranges
// https://leetcode.com/problems/rotting-oranges/description/
class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        var queue = [Position]()
        var visited = Set<Position>()
        let rows = grid.count
        let cols = grid[0].count
        var count = 0
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        for row in 0 ..< rows {
            for col in 0 ..< cols {
                if grid[row][col] == 2 {
                    queue.append(.init(row, col))
                }
            }
        }

        while !queue.isEmpty {
            count += 1
            let queueLen = queue.count
            for _ in 0 ..< queueLen {
                let node = queue.removeFirst()

                for direction in directions {
                    let newR = node.row + direction.0
                    let newC = node.col + direction.1
                    bfs(newR, newC)
                }
            }
        }

        for row in 0 ..< rows {
            for col in 0 ..< cols {
                if grid[row][col] == 1 {
                    return -1
                }
            }
        }
        return count == 0 ? 0 : count - 1

        func bfs(_ r: Int, _ c: Int) {
            guard min(r, c) >= 0, r < rows, c < cols,
                  grid[r][c] == 1, !visited.contains(.init(r, c)) else { return }
            grid[r][c] = 2
            visited.insert(.init(r, c))
            queue.append(.init(r, c))
        }
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
