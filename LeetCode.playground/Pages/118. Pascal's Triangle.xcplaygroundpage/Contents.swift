// 118. Pascal's Triangle
// https://leetcode.com/problems/pascals-triangle/description/

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        result.append([1])
        for i in 1 ..< numRows {
            var curr = [Int]()

            for j in 0 ..< i + 1 {
                if j - 1 < 0 || j >= result[result.count - 1].count {
                    curr.append(1)
                } else {
                    curr.append(result[result.count - 1][j] + result[result.count - 1][j - 1])
                }
            }
            result.append(curr)
        }
        return result
    }
}

var s = Solution()
assert(s.generate(5) == [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]])
