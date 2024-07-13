// 198. House Robber
// https://leetcode.com/problems/house-robber/description/
class Solution {
    func rob(_ nums: [Int]) -> Int {
        var one = 0
        var two = nums[0]

        for i in 1 ..< nums.count {
            var current = max(nums[i] + one, two)
            one = two
            two = current
        }
        return two
    }
}
