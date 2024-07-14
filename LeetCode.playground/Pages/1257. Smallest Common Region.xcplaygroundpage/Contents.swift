// 1257. Smallest Common Region
// https://leetcode.com/problems/smallest-common-region/description/
class Solution {
    func findSmallestRegion(_ regions: [[String]], _ region1: String, _ region2: String) -> String {
        var adjList = [String: String]()
        var queue = [String]()
        var visited = Set<String>()
        for index in 0 ..< regions.count {
            var baseRegion = regions[index][0]
            for j in 1 ..< regions[index].count {
                adjList[regions[index][j]] = baseRegion
            }
        }

        queue.append(contentsOf: [region1, region2])
        while !queue.isEmpty {
            let queueLen = queue.count
            for _ in 0 ..< queueLen {
                let node = queue.removeFirst()
                if visited.contains(node) { return node }
                visited.insert(node)
                if let nei = adjList[node] {
                    queue.append(nei)
                }
            }
        }
        return ""
    }
}
