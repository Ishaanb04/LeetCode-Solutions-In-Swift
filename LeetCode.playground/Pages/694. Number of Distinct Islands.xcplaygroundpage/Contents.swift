// 694. Number of Distinct Islands
// https://leetcode.com/problems/number-of-distinct-islands/description/
class Solution {
    func numDistinctIslands(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var visited = Set<Position>()
        var current = [[Int]]()
        var result = Set<[[Int]]>()
        for row in 0 ..< rows {
            for col in 0 ..< cols {
                if grid[row][col] == 1 &&
                    !visited.contains(.init(row, col))
                {
                    current = [[Int]]()
                    dfs(row, col)
                    if !current.isEmpty {
                        var base = current[0]
                        current = current.map { [base[0] - $0[0], base[1] - $0[1]] }
                    }
                    result.insert(current)
                }
            }
        }
        func dfs(_ r: Int, _ c: Int) {
            guard min(r, c) >= 0, r < rows, c < cols,
                  !visited.contains(.init(r, c)), grid[r][c] == 1 else { return }
            visited.insert(.init(r, c))
            current.append([r, c])
            dfs(r + 1, c)
            dfs(r - 1, c)
            dfs(r, c + 1)
            dfs(r, c - 1)
        }
        return result.count
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
