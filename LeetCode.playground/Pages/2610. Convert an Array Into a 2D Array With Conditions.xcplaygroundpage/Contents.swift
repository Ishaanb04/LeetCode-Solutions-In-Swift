// 2610. Convert an Array Into a 2D Array With Conditions
// https://leetcode.com/problems/convert-an-array-into-a-2d-array-with-conditions/description/

class Solution {
    func findMatrix(_ nums: [Int]) -> [[Int]] {
        var hmap = [Int: Int]()
        var output = [[Int]]()
        output.append([])
        for i in 0 ..< nums.count {
            if let rowVal = hmap[nums[i]] {
                if rowVal >= output.count {
                    output.append([])
                }
                output[rowVal].append(nums[i])
            } else {
                output[0].append(nums[i])
            }
            hmap[nums[i], default: 0] += 1
        }
        return output
    }
}
