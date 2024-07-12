//323. Number of Connected Components in an Undirected Graph
//https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/description/
import Foundation

class Solution {
    // Union Find Approach
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var u1 = UF(n)
        for edge in edges {
            u1.union(edge[0], edge[1])
        }
        return u1.countComponents
    }

    // DFS Approach
    func countComponentsDFS(_ n: Int, _ edges: [[Int]]) -> Int {
        var visited = Set<Int>()
        var adjList = [Int: [Int]]()

        for edge in edges {
            adjList[edge[0], default: []].append(edge[1])
            adjList[edge[1], default: []].append(edge[0])
        }

        func dfs(_ node: Int) {
            guard !visited.contains(node) else { return }
            visited.insert(node)
            for nei in adjList[node, default: []] {
                if !visited.contains(nei) {
                    dfs(nei)
                }
            }
        }
        var count = 0
        for i in 0 ..< n {
            if !visited.contains(i) {
                dfs(i)
                count += 1
            }
        }
        return count
    }
}

class UF {
    var parent = [Int]()
    var countComponents: Int = 0
    init(_ n: Int) {
        initializeParent(n)
        countComponents = n
    }

    func initializeParent(_ n: Int) {
        for i in 0 ..< n {
            parent.append(i)
        }
    }

    func findParent(_ node: Int) -> Int {
        var p = parent[node]
        while p != parent[p] {
            parent[p] = parent[parent[p]]
            p = parent[p]
        }
        return p
    }

    func union(_ node1: Int, _ node2: Int) {
        var root1 = findParent(node1)
        var root2 = findParent(node2)

        if root1 == root2 {
            return
        }
        countComponents -= 1
        parent[root1] = root2
    }
}

//: [Next](@next)
