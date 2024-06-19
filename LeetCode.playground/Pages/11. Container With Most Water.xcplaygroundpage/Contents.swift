// 11. Container With Most Water
// https://leetcode.com/problems/container-with-most-water/description/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var start = 0
        var end = height.count - 1
        var maxArea = Int.min

        while start < end {
            let currArea = min(height[start], height[end]) * (end - start
            )
            maxArea = max(maxArea, currArea)
            if height[start] < height[end] {
                start += 1
            } else {
                end -= 1
            }
        }
        return maxArea
    }
}
