// 1685. Sum of Absolute Differences in a Sorted Array
// https://leetcode.com/problems/sum-of-absolute-differences-in-a-sorted-array/description/

class Solution {
    // Time: O(n^2) - Time Limit Exeeded
    func getSumAbsoluteDifferences(_ nums: [Int]) -> [Int] {
        var result = Array(Array(repeating: 0, count: nums.count))
        for i in 0 ..< nums.count {
            var sum = 0
            for j in 0 ..< nums.count {
                sum += abs(nums[i] - nums[j])
            }
            result[i] = sum
        }
        return result
    }

    func getSumAbsoluteDifferences2(_ nums: [Int]) -> [Int] {
        var lSum = 0
        var rSum = nums.reduce(0) { $0 + $1 } - nums[0]
        
        var result = Array(repeating: 0, count: nums.count)
        for i in 0 ..< nums.count {
            var rVal = rSum - (nums[i] * (nums.count - i - 1))
            var lVal = (i * nums[i]) - lSum
            result[i] = rVal + lVal
            rSum -= nums[i]
            lSum += nums[i]
        }
        return result
    }
}
