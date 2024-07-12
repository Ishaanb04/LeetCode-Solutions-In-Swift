// 547. Number of Provinces
// https://leetcode.com/problems/number-of-provinces/description/

class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var graph = [Int: [Int]]()
        var visited = Set<Int>()
        for row in 0 ..< isConnected.count {
            for col in 0 ..< isConnected.count {
                if isConnected[row][col] == 1 {
                    if !graph[row, default: []].contains(col) { graph[row, default: []].append(col) }
                    if !graph[col, default: []].contains(row) { graph[col, default: []].append(row) }
                }
            }
        }

        func dfs(_ node: Int) {
            guard !visited.contains(node) else { return }
            visited.insert(node)
            for nei in graph[node, default: []] {
                dfs(nei)
            }
        }
        var result = 0
        for index in 0 ..< isConnected.count {
            if !visited.contains(index) {
                dfs(index)
                result += 1
            }
        }
        return result
    }
}
