// 523. Continuous Subarray Sum
// https://leetcode.com/problems/continuous-subarray-sum/description/

class Solution {
    // Brute Force: O(n ^ 2)
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        for i in 0 ..< nums.count {
            var sum = 0
            for j in i ..< nums.count {
                sum += nums[j]
                if sum % k == 0, j - i + 1 >= 2 { return true }
            }
        }
        return false
    }

    func checkSubarraySum2(_ nums: [Int], _ k: Int) -> Bool {
        var prefixHmap = [Int: Int]() // Remainder: End Index
        prefixHmap[0] = -1
        var sum = 0
        for index in 0 ..< nums.count {
            sum += nums[index]
            if let endIndex = prefixHmap[sum % k] {
                if index - endIndex + 1 > 2 {
                    return true
                }
            } else {
                prefixHmap[sum % k] = index
            }
        }
        return false
    }
}
