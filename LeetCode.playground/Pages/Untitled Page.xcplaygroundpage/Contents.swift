// 1020. Number of Enclaves
// https://leetcode.com/problems/number-of-enclaves/description/

struct Position: Hashable {
    var row: Int
    var col: Int

    init(_ row: Int, _ col: Int) {
        self.row = row
        self.col = col
    }
}

class Solution {
    func numEnclaves(_ grid: [[Int]]) -> Int {
        var visited = Set<Position>()
        let rows = grid.count
        let cols = grid[0].count
        var grid = grid

        for row in 0 ..< rows {
            for col in 0 ..< cols {
                if !visited.contains(.init(row, col)), grid[row][col] == 1 {
                    if row == 0 {
                        dfs(row, col)
                    }
                    if col == 0 {
                        dfs(row, col)
                    }
                    if row == rows - 1 {
                        dfs(row, col)
                    }
                    if col == cols - 1 {
                        dfs(row, col)
                    }
                }
            }
        }

        func dfs(_ r: Int, _ c: Int) {
            guard min(r, c) >= 0, r < rows, c < cols,
                  !visited.contains(.init(r, c)), grid[r][c] == 1 else { return }
            visited.insert(.init(r, c))
            grid[r][c] = 2
            dfs(r + 1, c)
            dfs(r - 1, c)
            dfs(r, c + 1)
            dfs(r, c - 1)
        }
        var count = 0
        for row in 0 ..< rows {
            for col in 0 ..< cols {
                if grid[row][col] == 1 {
                    count += 1
                }
            }
        }
        return count
    }
}
