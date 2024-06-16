// 80. Remove Duplicates from Sorted Array II
// https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/description/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var elemCount = 1
        var lastPosition = 1
        for i in 1 ..< nums.count {
            if nums[i - 1] == nums[i] {
                if elemCount < 2 {
                    nums[lastPosition] = nums[i]
                    lastPosition += 1
                    elemCount += 1
                }
            } else {
                nums[lastPosition] = nums[i]
                lastPosition += 1
                elemCount = 1
            }
        }
        return lastPosition
    }
}
