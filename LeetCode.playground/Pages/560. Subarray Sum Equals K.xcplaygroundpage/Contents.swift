// 560. Subarray Sum Equals K
// https://leetcode.com/problems/subarray-sum-equals-k/description/

class Solution {
    // Brute-Force Solution- O(n^2)
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var sum = 0
        var count = 0
        for i in 0 ..< nums.count {
            sum = 0
            for j in i ..< nums.count {
                sum += nums[j]
                if sum == k {
                    count += 1
                }
            }
        }
        return count
    }
    
    // Prefix Sum using hMap
    func subarraySum2(_ nums: [Int], _ k: Int) -> Int {
        var prefixCount = [Int: Int]()
        var sum = 0
        var result = 0
        prefixCount[0] = 1
        
        for num in nums {
            sum += num
            
            if let count = prefixCount[sum - k] {
                result += count
            }
            prefixCount[sum, default: 0] += 1
        }
        return result
    }
}
