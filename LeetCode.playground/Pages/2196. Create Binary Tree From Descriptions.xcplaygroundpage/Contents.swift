// 2196. Create Binary Tree From Descriptions
// https://leetcode.com/problems/create-binary-tree-from-descriptions/?envType=daily-question&envId=2024-07-15
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
    func createBinaryTree(_ descriptions: [[Int]]) -> TreeNode? {
        var childSet = Set<Int>()
        var root: TreeNode?
        var mapping = [Int: TreeNode]()
        for description in descriptions {
            let parent = description[0]
            let child = description[1]
            let isLeft = description[2] == 1
            let parentNode: TreeNode?
            let childNode: TreeNode?
            if mapping[parent] == nil {
                parentNode = TreeNode(parent)
                mapping[parent] = parentNode
            } else {
                parentNode = mapping[parent]
            }

            if mapping[child] == nil {
                childNode = TreeNode(child)
                mapping[child] = childNode
            } else {
                childNode = mapping[child]
            }
            childSet.insert(child)

            if isLeft {
                parentNode?.left = childNode
            } else {
                parentNode?.right = childNode
            }
        }

        for description in descriptions {
            if !childSet.contains(description[0]) { return mapping[description[0]] }
        }
        return nil
    }
}
