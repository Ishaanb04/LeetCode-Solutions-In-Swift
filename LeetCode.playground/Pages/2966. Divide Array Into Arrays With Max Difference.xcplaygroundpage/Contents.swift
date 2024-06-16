// 2966. Divide Array Into Arrays With Max Difference
// https://leetcode.com/problems/divide-array-into-arrays-with-max-difference/description/

class Solution {
    func divideArray(_ nums: [Int], _ k: Int) -> [[Int]] {
        var nums = nums.sorted { $0 < $1 }
        var output = [[Int]]()
        for i in 0 ..< nums.count / 3 {
            let start = i * 3
            let end = (i * 3) + 2
            if end < nums.count, nums[end] - nums[start] <= k {
                output.append(Array(nums[start ... end]))
            } else {
                return []
            }
        }
        return output
    }
}
