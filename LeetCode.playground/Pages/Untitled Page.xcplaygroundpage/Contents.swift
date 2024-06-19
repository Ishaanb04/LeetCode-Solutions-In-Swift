// 1343. Number of Sub-arrays of Size K and Average Greater than or Equal to Threshold
// https://leetcode.com/problems/number-of-sub-arrays-of-size-k-and-average-greater-than-or-equal-to-threshold/description/

class Solution {
    func numOfSubarrays(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
        var currentSum = 0
        var result = 0
        var start = 0

        for end in 0 ..< arr.count {
            currentSum += arr[end]
            if end - start + 1 == k {
                if currentSum / k >= threshold {
                    result += 1
                }
                currentSum -= arr[start]
                start += 1
            }
        }
        return result
    }
}
