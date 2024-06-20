// 1838. Frequency of the Most Frequent Element
// https://leetcode.com/problems/frequency-of-the-most-frequent-element/description/

class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        var start = 0
        var result = 0
        var difference = 0
        for end in 0 ..< nums.count {
            difference += abs(( end > 0 ? nums[end - 1] : 0) - nums[end])
            while difference > k {
                var s = nums[start]
                var newS = start < end ? nums[start + 1] : 0
                start += 1
                difference -= abs(s - newS)
            }
            result = max(result, end - start + 1)
        }
        return result
    }
}


