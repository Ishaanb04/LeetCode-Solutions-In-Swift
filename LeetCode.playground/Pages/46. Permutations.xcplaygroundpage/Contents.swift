//46. Permutations
//https://leetcode.com/problems/permutations/description/

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        
        func backtrack() {
            if current.count == nums.count{
                result.append(current)
            }
            
            for num in nums {
                if !current.contains(num) {
                    current.append(num)
                    backtrack()
                    current.removeLast()
                }
            }
        }
        backtrack()
        return result
    }
}
