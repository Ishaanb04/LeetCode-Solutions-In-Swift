// 153. Find Minimum in Rotated Sorted Array
// https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var result = Int.max
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            if nums[left] <= nums[right] {
                return nums[left]
            } else {
                var mid = left + (right - left) / 2
                if nums[mid] >= nums[left] {
                    left = mid + 1
                } else {
                    result = min(result, nums[mid])
                    right = mid - 1
                }
            }
        }
        return result
    }
}
