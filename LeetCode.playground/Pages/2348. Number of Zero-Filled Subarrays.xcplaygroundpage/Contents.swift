// 2348. Number of Zero-Filled Subarrays
// https://leetcode.com/problems/number-of-zero-filled-subarrays/description/

class Solution {
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var result = 0
        var count = 0
        for index in 0 ..< nums.count {
            if nums[index] == 0 {
                count += 1
            } else {
                result += (count * (count + 1)) / 2
                print(result)
                count = 0
            }
        }
        result += (count * (count + 1)) / 2
        return result
    }
}

var s = Solution()
print(s.zeroFilledSubarray([0,0,0,2,0,0]))