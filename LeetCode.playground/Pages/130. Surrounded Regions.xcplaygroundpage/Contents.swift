// 130. Surrounded Regions
// https://leetcode.com/problems/surrounded-regions/description/

struct Position: Hashable {
    var row: Int
    var col: Int

    init(_ row: Int, _ col: Int) {
        self.row = row
        self.col = col
    }
}

class Solution {
    func solve(_ board: inout [[Character]]) {
        var visited = Set<Position>()
        let rows = board.count
        let cols = board[0].count

        for row in 0 ..< rows {
            for col in 0 ..< cols {
                if !visited.contains(.init(row, col)), board[row][col] == "O" {
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
                  !visited.contains(.init(r, c)), board[r][c] == "O" else { return }
            visited.insert(.init(r, c))
            board[r][c] = "Y"
            dfs(r + 1, c)
            dfs(r - 1, c)
            dfs(r, c + 1)
            dfs(r, c - 1)
        }
        for row in 0 ..< rows {
            for col in 0 ..< cols {
                if board[row][col] == "O" {
                    board[row][col] = "X"
                } else if board[row][col] == "Y" {
                    board[row][col] = "O"
                }
            }
        }
    }
}
