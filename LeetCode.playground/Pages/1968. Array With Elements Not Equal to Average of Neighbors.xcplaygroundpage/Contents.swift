// 1968. Array With Elements Not Equal to Average of Neighbors
// https://leetcode.com/problems/array-with-elements-not-equal-to-average-of-neighbors/description/

class Solution {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var nums = nums.sorted()
        var result = Array(repeating: 0, count: nums.count)

        var counter = 0
        for i in stride(from: 0, to: nums.count, by: 2) {
            result[i] = nums[counter]
            counter += 1
        }
        for i in stride(from: 1, to: nums.count, by: 2) {
            result[i] = nums[counter]
            counter += 1
        }
        return result
    }
}
