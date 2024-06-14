// 665. Non-decreasing Array
// https://leetcode.com/problems/non-decreasing-array/description/

class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        var canChange = true
        var nums = nums
        for i in 0 ..< nums.count - 1 {
            if canChange {
                if nums[i] > nums[i + 1] {
                    if i == 0 {
                        nums[i] = nums[i + 1]
                    } else {
                        if nums[i - 1] > nums[i + 1] {
                            nums[i + 1] = nums[i]
                        } else {
                            nums[i] = nums[i + 1]
                        }
                    }
                    canChange = false
                }
            } else {
                if nums[i] > nums[i + 1] { return false }
            }
        }
        return true
    }
}
