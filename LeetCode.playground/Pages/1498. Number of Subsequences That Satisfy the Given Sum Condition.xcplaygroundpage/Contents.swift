// 1498. Number of Subsequences That Satisfy the Given Sum Condition
// https://leetcode.com/problems/number-of-subsequences-that-satisfy-the-given-sum-condition/description/

class Solution {
    func numSubseq(_ nums: [Int], _ target: Int) -> Int {
        var sortedNums = nums.sorted { $0 < $1 }
        var precomputedPower = Array(Array(repeating: 1, count: sortedNums.count))
        var mod = 1_000_000_000 + 7

        for i in 1 ..< sortedNums.count {
            precomputedPower[i] = (precomputedPower[i - 1] * 2) % mod
        }

        var left = 0
        var right = sortedNums.count - 1
        var result = 0

        while left <= right {
            var t = sortedNums[left] + sortedNums[right]
            if t <= target {
                result = (result + precomputedPower[right - left]) % mod
                left += 1
            } else {
                right -= 1
            }
        }
        return result
    }
}
