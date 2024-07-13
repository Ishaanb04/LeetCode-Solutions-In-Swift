// 1530. Number of Good Leaf Nodes Pairs
// https://leetcode.com/problems/number-of-good-leaf-nodes-pairs/description/
class Solution {
    func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
        var answer = 0
        func helper(_ node: TreeNode?) -> [Int] {
            guard let node = node else { return [] }

            if node.left == nil, node.right == nil { return [1] }

            var leftNodes = helper(node.left)
            var rigthNodes = helper(node.right)

            for left in leftNodes {
                for right in rigthNodes {
                    if left + right <= distance { answer += 1 }
                }
            }
            return Array(leftNodes.map { $0 + 1 }) + Array(rigthNodes.map { $0 + 1 })
        }
        helper(root)
        return answer
    }
}
