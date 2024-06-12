// 280. Wiggle Sort
// https://leetcode.com/problems/wiggle-sort/description/

class Solution {
    func wiggleSort(_ nums: inout [Int]) {
        var nums = nums.sorted { $0 < $1 }
        
        var start = 0
        var result = Array(Array(repeating: 0, count: nums.count))
        var count = 0
        while count < nums.count {
            result[count] = nums[start]
            start += 1
            count += 2
        }
        count = 1
        while count < nums.count {
            result[count] = nums[start]
            start += 1
            count += 2
        }
        nums = result
    }
    
    func wiggleSort(_ nums: inout [Int]) {
        var needsSwap = true
        
        for i in 0 ..< nums.count - 1 {
            if needsSwap == nums[i] > nums[i + 1] {
                nums.swapAt(i, i + 1)
            }
            needsSwap.toggle()
        }
    }
}
