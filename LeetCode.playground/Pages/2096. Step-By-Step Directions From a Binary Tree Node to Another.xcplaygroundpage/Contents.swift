// 2096. Step-By-Step Directions From a Binary Tree Node to Another
// https://leetcode.com/problems/step-by-step-directions-from-a-binary-tree-node-to-another/description/?envType=daily-question&envId=2024-07-16
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        var adjList = [Int: [(Int, String)]]()
        var queue = [(Int, String)]()
        var visited = Set<Int>()
        queue.append((startValue, ""))
        func inOrder(_ node: TreeNode?) {
            guard let node else { return }

            if let left = node.left {
                adjList[left.val, default: []].append((node.val, "U"))
                adjList[node.val, default: []].append((left.val, "L"))
            }

            if let right = node.right {
                adjList[right.val, default: []].append((node.val, "U"))
                adjList[node.val, default: []].append((right.val, "R"))
            }
            inOrder(node.left)
            inOrder(node.right)
        }
        inOrder(root)

        while !queue.isEmpty {
            var queueLen = queue.count
            for _ in 0 ..< queueLen {
                var node = queue.removeFirst()
                var nodeVal = node.0
                var nodePath = node.1
                if nodeVal == destValue { return nodePath }

                for nei in adjList[nodeVal, default: []] {
                    if !visited.contains(nei.0) {
                        queue.append((nei.0, nodePath + nei.1))
                        visited.insert(nei.0)
                    }
                }
            }
        }
        return ""
    }
}
