// 35. Search Insert Position
// https://leetcode.com/problems/search-insert-position/description/
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        var mid = 0
        while left <= right {
            mid = left + (right - left) / 2
            if target < nums[mid] {
                right = mid - 1
            } else if target > nums[mid] {
                left = mid + 1
            } else {
                return mid
            }
        }
        return mid + 1
    }
}
