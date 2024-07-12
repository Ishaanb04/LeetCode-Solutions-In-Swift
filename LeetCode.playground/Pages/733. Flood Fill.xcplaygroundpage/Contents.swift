//733. Flood Fill
//https://leetcode.com/problems/flood-fill/description/

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        guard image[sr][sc] != color else {return image}
        var image = image
        var visited = Set<Position>()
        var initial = image[sr][sc]
        func dfs(_ row: Int, _ col: Int,_ initial: Int) {
            guard min(row, col) >= 0, row < image.count,
            col < image[0].count, image[row][col] == initial,
            !visited.contains(.init(row, col)) else {return}
            image[row][col] = color
            visited.insert(.init(row, col))
            dfs(row + 1, col, initial)
            dfs(row - 1, col, initial)
            dfs(row, col + 1, initial)
            dfs(row, col - 1, initial)
        }
        dfs(sr, sc, initial)
        return image
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
