class Solution {
    // 75. Sort Colors
    // https://leetcode.com/problems/sort-colors/description/
    // Two Passes
    func sortColors(_ nums: inout [Int]) {
        var startIndex = 0
        for index in 0 ..< nums.count {
            if nums[index] == 0 {
                nums.swapAt(startIndex, index)
                startIndex += 1
            }
        }
        
        var endIndex = nums.count - 1
        for index in stride(from: nums.count - 1, through: 0, by: -1) {
            if nums[index] == 2 {
                nums.swapAt(endIndex, index)
                endIndex -= 1
            }
        }
    }
    
    // Single Pass
    func sortColors(_ nums: inout [Int]) {
        var start = 0
        var end = nums.count - 1
        var current = 0
        
        while current < end {
            if nums[current] == 0 {
                nums.swapAt(current, start)
                start += 1
                current += 1
            } else if nums[current] == 2 {
                nums.swapAt(current, end)
                end -= 1
            } else {
                current += 1
            }
        }
    }
}
