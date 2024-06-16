// 167. Two Sum II - Input Array Is Sorted
// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var start = 0
        var end = numbers.count - 1

        while start < end {
            let sum = numbers[start] + numbers[end]
            if sum < target {
                start += 1
            } else if sum > target {
                end -= 1
            } else {
                return [start + 1, end + 1]
            }
        }
        return []
    }
}
